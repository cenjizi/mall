package com.kzh.service.impl;

import com.kzh.dao.ProductCommentsMapper;
import com.kzh.entity.ProductComments;
import com.kzh.entity.ProductCommentsVO;
import com.kzh.service.ProductCommontsService;
import com.kzh.utils.PageHelper;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.HashMap;
import java.util.List;

@Service
public class ProductCommontsServiceImpl implements ProductCommontsService {
    @Autowired
    private ProductCommentsMapper productCommentsMapper;
    private Logger logger = LoggerFactory.getLogger(ProductCommontsServiceImpl.class);

    @Override
    public ResultVO productCommonts(String productId,int pageNum,int limit) {
        //1.查询总记录数
        Example example = new Example(ProductComments.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        int count = productCommentsMapper.selectCountByExample(example);
        if(count>0) {
            //2.计算总页数
            int pageCount = count % limit == 0 ? count / limit : count / limit + 1;

            //3.查询当前页的数据
            int start = (pageNum - 1) * limit;
            List<ProductCommentsVO> commonts = productCommentsMapper.
                    selectCommontsByProductId(productId, start, limit);
            logger.info("商品评论信息查询成功");
            return new ResultVO(ResStatus.OK,"商品评论信息查询成功",
                                new PageHelper<ProductCommentsVO>(count,pageCount,commonts));
        } else {
            logger.info("此商品暂无评论");
            return new ResultVO(ResStatus.NO, "此商品暂无评论", null);
        }
    }

    @Override
    public ResultVO productCommontsType(String productId) {
        //查询评论总数
        Example example = new Example(ProductComments.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        int count = productCommentsMapper.selectCountByExample(example);
        if(count>0) {

            //2.查询好评数
            criteria.andEqualTo("commType", 1);
            int goodCount = productCommentsMapper.selectCountByExample(example);

            //3.查询中评数
            Example example1 = new Example(ProductComments.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("productId",productId);
            criteria1.andEqualTo("commType", 0);
            int midCount = productCommentsMapper.selectCountByExample(example1);

            //4.查询差评数
            Example example2 = new Example(ProductComments.class);
            Example.Criteria criteria2 = example2.createCriteria();
            criteria2.andEqualTo("productId",productId);
            criteria2.andEqualTo("commType", -1);
            int badCount = productCommentsMapper.selectCountByExample(example2);

            //5.计算好评率
            double percent = Double.parseDouble(goodCount + "") / Double.parseDouble(count + "") * 100;
            String p = (percent + "00000").substring(0,(percent + "").lastIndexOf(".") + 3);

            HashMap<String, Object> map = new HashMap<>();
            map.put("count", count);
            map.put("goodCount", goodCount);
            map.put("midCount", midCount);
            map.put("badCount", badCount);
            map.put("percent", p);
            logger.info("商品评论情况统计成功");
            return new ResultVO(ResStatus.OK, "商品评论情况统计成功", map);
        } else {
            logger.info("此商品暂无评论");
            return new ResultVO(ResStatus.NO, "此商品暂无评论", null);
        }
    }
}
