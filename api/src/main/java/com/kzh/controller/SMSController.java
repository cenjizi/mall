package com.kzh.controller;

import com.kzh.service.SMSService;
import com.kzh.utils.RandomUtil;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Api(value = "发送验证码的接⼝",tags = "阿里云短信服务")
@RestController
@RequestMapping("/sms")
@CrossOrigin
public class SMSController {
    @Autowired
    private SMSService msmService;

    //发送短信验证码
    @ApiOperation(value = "发送短信验证码")
    @GetMapping(value = "/send/{phone}")
    public ResultVO code(@PathVariable String phone) {
        //2、如果获取不到，就进行阿里云发送
        String code = RandomUtil.getFourBitRandom();//生成验证码的随机值
        Map<String,Object> param = new HashMap<>();
        param.put("code", code);

        //调用方法
        boolean isSend = msmService.send(param,phone);
        if(isSend) {
            return new ResultVO(ResStatus.OK,"短信发送成功",code);
        } else {
            return new ResultVO(ResStatus.NO,"短信发送失败",null);
        }
    }
}