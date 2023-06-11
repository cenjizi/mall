package com.kzh.service;

import com.kzh.vo.ResultVO;

public interface CategoryService {
    //查询分类列表
    public ResultVO allCategories();
    //查询一级分类及其笑销售量最高的六个商品
    public ResultVO firstProductList();
}
