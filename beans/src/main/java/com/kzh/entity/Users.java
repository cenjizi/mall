package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {

    private Integer userId;

    private String username;

    private String password;

    private String nickname;

    private String userImg;

    private String userMobile;

    private String userSex;

    private Date userRegtime;  //注册时间

    private Date userModtime;  //更新时间
}