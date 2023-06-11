package com.kzh.dao;

import com.kzh.entity.ProductImg;
import com.kzh.general.GeneralDAO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImgMapper extends GeneralDAO<ProductImg> {

    public List<ProductImg> selectProductImgByProductId(int productId);

}