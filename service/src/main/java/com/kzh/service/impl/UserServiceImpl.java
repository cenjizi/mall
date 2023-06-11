package com.kzh.service.impl;

import com.kzh.dao.UsersMapper;
import com.kzh.entity.Users;
import com.kzh.service.UserService;
import com.kzh.utils.MD5Utils;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersMapper usersMapper;

    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    /**
     * 用户注册
     * @param name
     * @param pwd
     * @return
     */
    @Transactional
    public ResultVO userRegister(String name, String pwd) {
        synchronized (this) {
            //1.根据用户查询，这个用户是否已经被注册
            Example example = new Example(Users.class);  //创建一个 Example 对象，它是 MyBatis 的一个查询条件封装类，用于创建查询条件。
            Example.Criteria criteria = example.createCriteria();  //从 Example 对象中创建一个 Criteria 对象，它代表一个查询条件。
            criteria.andEqualTo("username", name);  //调用 andEqualTo() 方法设置查询条件，表示查询用户名为 name 的用户信息。
            List<Users> users = usersMapper.selectByExample(example);  //调用 usersMapper 的 selectByExample() 方法，
                                                                       // 执行查询操作，并返回查询结果列表。查询结果是一个 List<Users> 类型的对象。

            //2.如果没有被注册则进行保存操作
            if (users.size() == 0 & name != "" & pwd != "") {
                String md5Pwd = MD5Utils.md5(pwd);  //md5加密
                Users user = new Users();
                user.setUsername(name);
                user.setNickname(name);  //默认设置用户昵称为用户名
                user.setPassword(md5Pwd);
                user.setUserImg("images/default.png");
                user.setUserRegtime(new Date());
                user.setUserModtime(new Date());
                int i = usersMapper.insertUseGeneratedKeys(user);
                if (i > 0) {
                    logger.info("注册成功");
                    return new ResultVO(ResStatus.OK, "注册成功！", user);
                } else {
                    logger.info("注册失败");
                    return new ResultVO(ResStatus.NO, "注册失败！", null);
                }
            } else {
                logger.info("用户名已存在");
                return new ResultVO(ResStatus.NO, "用户名已存在！", null);
            }
        }
    }

    /**
     * 用户登录
     * @param name
     * @param pwd
     * @return
     */
    @Override
    public ResultVO checkLogin(String name, String pwd) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", name);
        List<Users> users = usersMapper.selectByExample(example);

        if(users.size() == 0){
            logger.info("登录失败，用户名不存在");
            return new ResultVO(ResStatus.NO,"登录失败，用户名不存在！",null);
        }else{
            String md5Pwd = MD5Utils.md5(pwd);
            if(md5Pwd.equals(users.get(0).getPassword())){
                //如果登录验证成功，则需要生成令牌token（token就是按照特定规则生成的字符串）
                //使用jwt规则生成token字符串
                JwtBuilder builder = Jwts.builder();
                String token = builder.setSubject(name)                     //主题，就是token中携带的数据
                        .setIssuedAt(new Date())                            //设置token的生成时间
                        .setId(users.get(0).getUserId() + "")               //设置用户id为token id
                        .setExpiration(new Date(System.currentTimeMillis() + 24*60*60*1000)) //设置token过期时间为1天后
                        .signWith(SignatureAlgorithm.HS256, "kzh2023")     //设置加密方式和加密密码
                        .compact();                                         //返回一个字符串
                logger.info("登录成功");
                return new ResultVO(ResStatus.OK,token,users.get(0));
            }else{
                logger.info("登录失败，密码错误");
                return new ResultVO(ResStatus.NO,"登录失败，密码错误！",null);
            }
        }
    }
}
