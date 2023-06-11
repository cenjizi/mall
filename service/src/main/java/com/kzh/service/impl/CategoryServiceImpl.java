package com.kzh.service.impl;

import com.kzh.dao.CategoryMapper;
import com.kzh.entity.CategoryVO;
import com.kzh.service.CategoryService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    private Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);

    @Override
    public ResultVO allCategories() {
        List<CategoryVO> categories = categoryMapper.selectAllCategories();
        logger.info("分类列表查询成功");
        return new ResultVO(ResStatus.OK,"分类列表查询成功",categories);
    }

    @Override
    public ResultVO firstProductList() {
        List<CategoryVO> firstLevel = categoryMapper.selectFirstLevelCategories();
        logger.info("分类推荐查询成功");
        return new ResultVO(ResStatus.OK,"分类推荐查询成功",firstLevel);
    }
}
