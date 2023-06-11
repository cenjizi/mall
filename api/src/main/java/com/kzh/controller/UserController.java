package com.kzh.controller;

import com.kzh.entity.Users;
import com.kzh.service.UserService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@CrossOrigin  //解决前端跨域访问：设置响应头运行跨域
@Api(value = "提供⽤户的登录和注册接⼝",tags = "⽤户管理")
public class UserController {
    @Autowired
    private UserService userService;

    @ApiOperation("用户注册接口")
    @PostMapping("/register")
    public ResultVO regist(@ApiParam(name = "user", value = "用户信息", required = true)
                               @RequestBody Users user){
        ResultVO resultVO = userService.userRegister(user.getUsername(), user.getPassword());
        return resultVO;
    }

    @ApiOperation("校验token是否过期接口")
    @GetMapping("/check")
    public ResultVO userTokencheck(@RequestHeader("token") String token){
        return new ResultVO(ResStatus.LOGIN_SUCCESS,"success",null);
    }

    @ApiOperation("⽤户登录接⼝")
    @GetMapping("/login")
    public ResultVO login(@ApiParam(name = "username",value = "⽤户登录账号",required = true)
                              @RequestParam("username") String username,
                          @ApiParam(name = "password",value = "⽤户登录密码",required = true)
                          @RequestParam("password") String password) {
        return userService.checkLogin(username,password);
    }
}
