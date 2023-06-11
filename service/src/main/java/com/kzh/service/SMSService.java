package com.kzh.service;

import java.util.Map;

public interface SMSService {
    //发送验证码
    public boolean send(Map<String, Object> param, String phone);

}
