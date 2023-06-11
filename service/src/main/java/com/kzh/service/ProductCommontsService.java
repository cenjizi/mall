package com.kzh.service;

import com.kzh.vo.ResultVO;

public interface ProductCommontsService {
    //查询商品评论及相关用户信息
    public ResultVO productCommonts(String productId,int pageNum,int limit);

    //统计商品评价情况(好评，中评，差评）
    public ResultVO productCommontsType(String productId);
}
