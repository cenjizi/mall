package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginHistory {
    private Integer id;
    private String area;
    private String country;
    private String userId;
    private String ip;
    private String loginTime;
}