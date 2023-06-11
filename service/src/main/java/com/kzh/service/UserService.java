package com.kzh.service;

import com.kzh.vo.ResultVO;

public interface UserService {

    //⽤户注册
    ResultVO userRegister(String name, String pwd);
    //⽤户登录
    ResultVO checkLogin(String name, String pwd);

}
