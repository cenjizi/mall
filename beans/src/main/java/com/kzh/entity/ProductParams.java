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
public class ProductParams {
    private String paramId;
    private String productId;
    private String productPublisher;
    private String author;
    private String packagingMethod;
    private String publicationDate;
    private Date createTime;
    private Date updateTime;
}