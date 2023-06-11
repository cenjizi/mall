package com.kzh.service;

import com.kzh.vo.ResultVO;

public interface ProductService {
    //查询最新上架的3个商品
    public ResultVO productList();

    //查询商品基本信息
    public ResultVO productInfo(String productId);

    //查询商品参数信息
    public ResultVO productParams(String productId);

    //查询“猜你喜欢”的6个推荐商品
    public ResultVO productsByFirstCategory(int firstCategoryId);

    //查询三级分类下的商品
    public ResultVO productsByThirdCategory(int categoryId,int pageNum,int limit);

    //查询三级分类下的品牌
    ResultVO listBrands(int categoryId);

    //关键字模糊查询商品名
    ResultVO searchProduct(String kw, int pageNum, int limit);

    //关键字模糊查询商品品牌
    ResultVO listBrands(String kw);
}
