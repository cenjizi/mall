package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IndexImg implements Serializable {

    private String imgId;

    private String imgUrl;

    private String imgBgColor;

    private String prodId;

    private String categoryId;

    private Integer indexType;

    private Integer seq;

    private Integer status;

    private Date createTime;

    private Date updateTime;

}