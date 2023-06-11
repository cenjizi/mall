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
public class ProductImg {

    private String id;
    private String itemId;
    private String url;
    private Integer sort;
    private Integer isMain;
    private Date createdTime;
    private Date updatedTime;

}