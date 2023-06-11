package com.kzh.service.impl;

import com.kzh.dao.UserAddrMapper;
import com.kzh.entity.UserAddr;
import com.kzh.service.UserAddrService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserAddrServiceImpl implements UserAddrService {
    @Autowired
    private UserAddrMapper userAddrMapper;

    private Logger logger = LoggerFactory.getLogger(UserAddrServiceImpl.class);

    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVO addrListByUid(int userId) {
        Example example = new Example(UserAddr.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        criteria.andEqualTo("status",1);
        List<UserAddr> userAddrs = userAddrMapper.selectByExample(example);
        logger.info("用户地址查询成功");
        return new ResultVO(ResStatus.OK,"用户地址查询成功",userAddrs);
    }

    @Transactional
    public ResultVO addAddr(UserAddr userAddr){
        if(userAddr.getUserId() !="" && userAddr.getReceiverMobile() != ""
            && userAddr.getReceiverName() != "" && userAddr.getProvince() != ""
            && userAddr.getProvince() != null && userAddr.getAddr() != "") {
            //1.根据详细地址查询，这个地址是否已经存在
            Example example = new Example(UserAddr.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("addr", userAddr.getAddr());
            List<UserAddr> userAddrs = userAddrMapper.selectByExample(example);
            if (userAddrs.size() == 0) {
                String addrId = UUID.randomUUID().toString().replace("-", "");
                userAddr.setAddrId(addrId);
                userAddr.setStatus(1);
                userAddr.setCommonAddr(0);
                userAddr.setCreateTime(new Date());
                userAddr.setUpdateTime(new Date());
                int i = userAddrMapper.insertUseGeneratedKeys(userAddr);
                if (i > 0) {
                    logger.info("地址添加成功");
                    return new ResultVO(ResStatus.OK, "地址添加成功！", userAddr);
                } else {
                    logger.info("地址添加失败");
                    return new ResultVO(ResStatus.ADD_FAIL, "地址添加失败！", null);
                }
            }else {
                logger.info("该地址已存在");
                return new ResultVO(ResStatus.NO, "该地址已存在！", null);
            }
        }else {
            logger.info("请完整填写表单");
            return new ResultVO(ResStatus.NO, "请完整填写表单！", null);
        }
    }

    @Override
    public ResultVO updateByAddrId(UserAddr userAddr) {
        userAddr.setUpdateTime(new Date());
        int i = userAddrMapper.updateAddrById(userAddr);
        if(i>0){
            logger.info("地址编辑成功");
            return new ResultVO(ResStatus.OK,"地址编辑成功",i);
        }else{
            logger.info("地址编辑失败");
            return new ResultVO(ResStatus.NO,"地址编辑失败",i);
        }
    }
}
