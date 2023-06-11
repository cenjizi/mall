package com.kzh.dao;

import com.kzh.entity.Product;
import com.kzh.entity.ProductVO;
import com.kzh.general.GeneralDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper extends GeneralDAO<Product> {
    /**
     * 查询推荐的商品
     * @return
     */
    public List<ProductVO> selectRecommendProducts();

    /**
     * 查询指定一级类别下销量最高的6个商品
     * @param cid
     * @return
     */
    public List<ProductVO> selectTop6ByCategory(int cid);

    /**
     * 根据三级分类ID分页查询商品信息
     * @param cid 三级分类id
     * @param start 起始索引
     * @param limit 查询记录数
     * @return
     */
    public List<ProductVO> selectProductByCategoryId(@Param("cid") int cid,
                                                     @Param("start") int start,
                                                     @Param("limit") int limit);

    /**
     * 根据类别id查询此类别下的商品的品牌列表
     * @param cid
     * @return
     */
    public List<String> selectBrandByCategoryId(int cid);


    /**
     * 根据关键字模糊搜索商品信息
     * @param keyword
     * @param start
     * @param limit
     * @return
     */
    public List<ProductVO> selectProductByKeyword(@Param("kw") String keyword,
                                                     @Param("start") int start,
                                                     @Param("limit") int limit);

    /**
     * 根据搜索关键字查询相关商品的品牌列表
     * @param kw
     * @return
     */
    public List<String> selectBrandByKeyword(String kw);

}

