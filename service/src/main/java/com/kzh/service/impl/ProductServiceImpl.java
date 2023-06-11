package com.kzh.service.impl;

import com.kzh.dao.ProductImgMapper;
import com.kzh.dao.ProductMapper;
import com.kzh.dao.ProductParamsMapper;
import com.kzh.dao.ProductSkuMapper;
import com.kzh.entity.*;
import com.kzh.service.ProductService;
import com.kzh.utils.PageHelper;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.HashMap;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductImgMapper productImgMapper;
    @Autowired
    private ProductSkuMapper productSkuMapper;
    @Autowired
    private ProductParamsMapper productParamsMapper;
    private Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);

    @Override
    public ResultVO productList() {
        List<ProductVO> products = productMapper.selectRecommendProducts();
        logger.info("商品推荐查询成功");
        return new ResultVO(ResStatus.OK,"商品推荐查询成功",products);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVO productInfo(String productId) {
        //1.查询商品基本信息
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        criteria.andEqualTo("productStatus",1);
        List<Product> products = productMapper.selectByExample(example);
        if(products.size() > 0) {
            //2.查询商品图片
            Example example1 = new Example(ProductImg.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("itemId",productId);
            List<ProductImg> productImgs = productImgMapper.selectByExample(example1);
            //3.查询商品套餐
            Example example2 = new Example(ProductSku.class);
            Example.Criteria criteria2 = example2.createCriteria();
            criteria2.andEqualTo("productId",productId);
            criteria2.andEqualTo("status",1);
            List<ProductSku> productSkus = productSkuMapper.selectByExample(example2);

            //封装到map里
            HashMap<Object, Object> baseInfo = new HashMap<>();
            baseInfo.put("products",products);
            baseInfo.put("productImgs",productImgs);
            baseInfo.put("productSkus",productSkus);
            logger.info("商品信息查询成功");
            return new ResultVO(ResStatus.OK,"商品信息查询成功",baseInfo);
        }else {
            logger.info("商品不存在");
            return new ResultVO(ResStatus.NO,"商品不存在",null);
        }
    }

    @Override
    public ResultVO productParams(String productId) {
        Example example = new Example(ProductParams.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        List<ProductParams> productParams = productParamsMapper.selectByExample(example);
        if(productParams.size() > 0) {
            logger.info("商品参数信息查询成功");
            return new ResultVO(ResStatus.OK, "商品参数信息查询成功", productParams.get(0));
        }else {
            logger.info("三无产品");
            return new ResultVO(ResStatus.NO, "三无产品", null);
        }
    }

    @Override
    public ResultVO productsByFirstCategory(int firstCategoryId) {
        List<ProductVO> productList = productMapper.selectTop6ByCategory(firstCategoryId);
        logger.info("猜你喜欢 查询成功");
        return new ResultVO(ResStatus.OK,"猜你喜欢 查询成功",productList);
    }

    @Override
    public ResultVO productsByThirdCategory(int categoryId, int pageNum, int limit) {
        logger.info("分页查询三级分类下的商品");
        //1.查询分页数据
        int start = (pageNum-1)*limit;
        List<ProductVO> productVOS = productMapper.selectProductByCategoryId(categoryId, start, limit);
        //2.查询当前类别下的商品的总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("categoryId",categoryId);
        int count = productMapper.selectCountByExample(example);
        //3.计算总页数
        int pageCount = count%limit==0? count/limit : count/limit+1;
        //4.封装返回数据
        PageHelper<ProductVO> pageHelper = new PageHelper<>(count, pageCount, productVOS);
        return new ResultVO(ResStatus.OK,"三级分类下的商品查询成功",pageHelper);
    }

    @Override
    public ResultVO listBrands(int categoryId) {
        logger.info("品牌查询");
        List<String> brands = productMapper.selectBrandByCategoryId(categoryId);
        return new ResultVO(ResStatus.OK,"品牌查询成功",brands);
    }

    @Override
    public ResultVO searchProduct(String kw, int pageNum, int limit) {
        logger.info("用关键字查询商品");
        //1.查询搜索结果
        kw = "%"+kw+"%";
        int start = (pageNum-1)*limit;
        List<ProductVO> productVOS = productMapper.selectProductByKeyword(kw, start, limit);

        //2.查询总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("productName",kw);
        int count = productMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0? count/limit:count/limit+1;

        //4.封装，返回数据
        PageHelper<ProductVO> pageHelper = new PageHelper<>(count, pageCount, productVOS);
        ResultVO resultVO = new ResultVO(ResStatus.OK, "用关键字查询商品成功", pageHelper);
        return resultVO;
    }

    @Override
    public ResultVO listBrands(String kw) {
        logger.info("用品牌查询商品");
        kw = "%"+kw+"%";
        List<String> brands = productMapper.selectBrandByKeyword(kw);
        return new ResultVO(ResStatus.OK,"用品牌查询商品成功",brands);
    }
}
