package com.kzh.controller;

import com.kzh.entity.ShoppingCart;
import com.kzh.service.ShoppingCartService;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/shopcart")
@CrossOrigin
@Api(value = "提供购物车业务相关接⼝",tags = "购物车管理")
public class ShopCartController {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/add")
    @ApiOperation("商品添加接⼝")
    @CacheEvict(value = "cartCache", key = "#token")
    public ResultVO addShoppingCart(@RequestBody ShoppingCart cart,
                                    @RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.addShoppingCart(cart);
        return resultVO;
    }

    @GetMapping("/list")
    @ApiOperation("查询购物车列表的接⼝")
    @Cacheable(value = "cartCache", key = "#token", unless = "#result.data.size() == 0")
    public ResultVO list(@ApiParam(name = "userId", value = "用户ID",required = true)
                             Integer userId,@RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.listShoppingCartsByUserId(userId);
        return resultVO;
    }

    @PutMapping("/update/{cid}/{cnum}")
    @ApiOperation("修改购物车中商品数量的接⼝")
    @CacheEvict(value = "cartCache", key = "#token")
    public ResultVO updateNum(@PathVariable("cid") Integer cartId,
                              @PathVariable("cnum") Integer cartNum,
                              @RequestHeader("token") String token){
        ResultVO resultVO = shoppingCartService.updateCartNum(cartId, cartNum);
        return resultVO;
    }

    @GetMapping("/listbycids")
    @ApiOperation("查询要结算商品的接⼝")
    @CacheEvict(value = "cartCache", key = "#token")
    public ResultVO listByCids(@ApiParam(name = "cids", value = "选择的购物车商品的id",required = true)
                                   String cids, @RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.listShoppingCartsByCids(cids);
        return resultVO;
    }

    @DeleteMapping("/deletebycids")
    @ApiOperation("删除购物车商品的接⼝")
    @CacheEvict(value = "cartCache", key = "#token")
    public ResultVO delete(@ApiParam(name = "cids", value = "选择的购物车商品的id",required = true)
                               @RequestParam("cids") String cids, @RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.deleteByCids(cids);
        return resultVO;
    }
}
