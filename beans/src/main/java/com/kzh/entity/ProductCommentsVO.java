package com.kzh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductCommentsVO {

    private String commId;
    private String productId;
    private String productName;
    private String orderItemId;
    private Integer isAnonymous;
    private Integer commType;
    private String commContent;
    private String commImgs;
    private Date sepcName;
    private Integer replyStatus;
    private String replyContent;
    private Date replyTime;
    private Integer isShow;
    //封装评论对应的用户数据
    private String userId;
    private String username;
    private String nickname;
    private String userImg;
}