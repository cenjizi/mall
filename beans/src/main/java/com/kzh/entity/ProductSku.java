package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSku {
    private String skuId;
    private String productId;
    private String skuName;
    private String skuImg;
    private String untitled;
    private Integer originalPrice;
    private Integer sellPrice;
    private BigDecimal discounts;
    private Integer stock;
    private Date createTime;
    private Date updateTime;
    private Integer status;
}