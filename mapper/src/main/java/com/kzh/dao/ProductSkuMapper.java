package com.kzh.dao;

import com.kzh.entity.ProductSku;
import com.kzh.general.GeneralDAO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductSkuMapper extends GeneralDAO<ProductSku> {

    /**
     * 根据商品ID，查询当前商品所有套餐中价格最低的套餐
     * @param productId
     * @return
     */
    public List<ProductSku> selectLowerestPriceByProductId(String productId);

}
