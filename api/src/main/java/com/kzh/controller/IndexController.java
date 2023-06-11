package com.kzh.controller;

import com.kzh.service.CategoryService;
import com.kzh.service.IndexImgService;
import com.kzh.service.ProductService;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/index")
@CrossOrigin  //解决前端跨域访问：设置响应头运行跨域
@Api(value = "提供首页数据显示所需的接⼝",tags = "首页管理")
public class IndexController {
    @Autowired
    private IndexImgService indexImgService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;

    @GetMapping("/img")
    @ApiOperation("首页轮播图接口")
    @Cacheable(value = "index",key = "'imgs'")
    public ResultVO img(){
        return indexImgService.listIndexImgs();
    }

    @GetMapping("/clist")
    @ApiOperation("分类列表查询接口")
    @Cacheable(value = "index",key = "'clist'")
    public ResultVO categoryList(){
        return categoryService.allCategories();
    }

    @GetMapping("/plist")
    @ApiOperation("商品推荐查询接口")
    public ResultVO recommendProductsList() {
        return productService.productList();
    }

    @GetMapping("/flist")
    @ApiOperation("分类推荐查询接口")
    public ResultVO firstLevel() {
        return categoryService.firstProductList();
    }
}
