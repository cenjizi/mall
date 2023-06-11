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
public class ProductComments {
    private String commId;

    private String productId;

    private String productName;

    private String orderItemId;

    private String userId;

    private Integer isAnonymous;

    private Integer commType;

    private String commContent;

    private String commImgs;

    private Date sepcName;

    private Integer replyStatus;

    private String replyContent;

    private Date replyTime;

    private Integer isShow;

}