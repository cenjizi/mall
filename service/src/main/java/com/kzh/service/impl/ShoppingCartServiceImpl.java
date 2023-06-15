package com.kzh.service.impl;

import com.kzh.dao.ShoppingCartMapper;
import com.kzh.entity.ShoppingCart;
import com.kzh.entity.ShoppingCartVO;
import com.kzh.service.ShoppingCartService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    private Logger logger = LoggerFactory.getLogger(ShoppingCartServiceImpl.class);

    @Override
    public ResultVO addShoppingCart(ShoppingCart cart) {
        Example example = new Example(ShoppingCart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",cart.getProductId());
        criteria.andEqualTo("skuId",cart.getSkuId());
        criteria.andEqualTo("skuProps",cart.getSkuProps());
        int count = shoppingCartMapper.selectCountByExample(example);
        if(count > 0) {
            logger.info("购物车中已有此套餐");
            return new ResultVO(ResStatus.ADD_FAIL,"购物车中已有此套餐",count);
        }else {
            cart.setCartTime(sdf.format(new Date()));
            int i = shoppingCartMapper.insert(cart);
            if (i > 0) {
                logger.info("商品添加成功");
                return new ResultVO(ResStatus.OK, "商品添加成功", i);
            } else {
                logger.info("商品添加失败");
                return new ResultVO(ResStatus.NO, "商品添加失败", i);
            }
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVO listShoppingCartsByUserId(Integer userId) {
        List<ShoppingCartVO> list = shoppingCartMapper.selectShopcartByUserId(userId);
        ResultVO resultVO;
            resultVO = new ResultVO(ResStatus.OK, "购物车查询成功", list);
        return resultVO;
    }

    @Override
    public ResultVO updateCartNum(int cartId, int cartNum) {
        int i = shoppingCartMapper.updateCartnumByCartid(cartId, cartNum);
        if(i>0){
            logger.info("商品数量更新成功");
            return new ResultVO(ResStatus.OK,"商品数量更新成功",i);
        }else{
            logger.info("商品数量更新失败");
            return new ResultVO(ResStatus.NO,"商品数量更新失败",i);
        }
    }

    @Override
    public ResultVO listShoppingCartsByCids(String cids) {
        //使用tkmapper只能查询到某张表中拥有的字段，因此没法查询到商品名称、图片、单价等信息
        String[] arr = cids.split(",");
        List<Integer> cartIds = new ArrayList<>();
        for (int i=0; i<arr.length; i++){
            cartIds.add(Integer.parseInt(arr[i]));
        }
        List<ShoppingCartVO> list = shoppingCartMapper.selectShopcartByCids(cartIds);
        logger.info("结算商品查询成功");
        ResultVO resultVO = new ResultVO(ResStatus.OK, "结算商品查询成功", list);
        return resultVO;
    }

    @Transactional
    public ResultVO deleteByCids(String cids) {
        String[] arr = cids.split(",");
        int r = 0;
        for (int i=0; i<arr.length; i++){
            r = shoppingCartMapper.deleteByPrimaryKey(Integer.parseInt(arr[i]));
        }
        if(r > 0){
            logger.info("购物车商品删除成功");
            return new ResultVO(ResStatus.OK,"购物车商品删除成功",r);
        }else{
            logger.info("购物车商品删除失败");
            return new ResultVO(ResStatus.NO,"购物车商品删除失败",r);
        }
    }
}

