package com.kzh.dao;

import com.kzh.entity.Category;
import com.kzh.entity.CategoryVO;
import com.kzh.general.GeneralDAO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper extends GeneralDAO<Category> {

    //1.1.连接查询
    public List<CategoryVO> selectAllCategories();

    //1.2.子查询：根据parentId查询子分类
    public List<CategoryVO> selectAllCategories2(int parentId);

    //2.查询一级类别
//    public List<Category> selectFirstLevelCategories();
    public List<CategoryVO> selectFirstLevelCategories();

}
