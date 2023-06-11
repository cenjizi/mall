package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAddr {
    private String addrId;
    private String userId;
    private String receiverName;
    private String receiverMobile;
    private String province;
    private String city;
    private String area;
    private String addr;
    private Integer status;
    private Integer commonAddr;
    private Date createTime;
    private Date updateTime;
}