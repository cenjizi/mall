package com.kzh.controller;

import com.kzh.entity.UserAddr;
import com.kzh.service.UserAddrService;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/useraddr")
@CrossOrigin//解决前端跨域访问：设置响应头运行跨域
@Api(value = "提供收货地址相关接⼝",tags = "地址管理")
public class UserAddrController {
    @Autowired
    private UserAddrService userAddrService;

    @GetMapping("/list")
    @ApiOperation("收货地址查询接口")
    public ResultVO addrList(@ApiParam(name = "userId", value = "用户id",required = true)
                                 Integer userId, @RequestHeader("token") String token) {
        ResultVO resultVO = userAddrService.addrListByUid(userId);
        return resultVO;
    }

    @PostMapping("/add")
    @ApiOperation("收货地址添加接口")
    public ResultVO addAddress(@ApiParam(name = "userAddr", value = "收货地址信息",required = true)
                             @RequestBody UserAddr userAddr, @RequestHeader("token") String token) {
        ResultVO resultVO = userAddrService.addAddr(userAddr);
        return resultVO;
    }

    @PutMapping("/update")
    @ApiOperation("收货地址编辑接口")
    public ResultVO updateAddress(@ApiParam(name = "userAddr", value = "收货地址信息",required = true)
                                    @RequestBody UserAddr userAddr,
                               @RequestHeader("token") String token) {
        ResultVO resultVO = userAddrService.updateByAddrId(userAddr);
        return resultVO;
    }
}