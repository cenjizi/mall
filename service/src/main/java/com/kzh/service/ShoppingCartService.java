package com.kzh.service;

import com.kzh.entity.ShoppingCart;
import com.kzh.vo.ResultVO;

public interface ShoppingCartService {

    //添加商品至购物车
    public ResultVO addShoppingCart(ShoppingCart cart);

    //查询用户的购物车列表
    public ResultVO listShoppingCartsByUserId(Integer userId);

    public ResultVO updateCartNum(int cartId,int cartNum);

    public ResultVO listShoppingCartsByCids(String cids);

    //删除购物车中的商品
    public ResultVO deleteByCids(String cids);

}
