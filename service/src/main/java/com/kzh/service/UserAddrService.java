package com.kzh.service;

import com.kzh.entity.UserAddr;
import com.kzh.vo.ResultVO;

public interface UserAddrService {

    //查询用户收货地址相关信息
    public ResultVO addrListByUid(int userId);

    //添加用户收获地址
    public ResultVO addAddr(UserAddr userAddr);

    //通过地址id更新收货地址（逻辑删除或修改默认地址的默认状态
    ResultVO updateByAddrId(UserAddr userAddr);
}
