package com.kzh.controller;

import com.kzh.service.ProductCommontsService;
import com.kzh.service.ProductService;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/product")
@CrossOrigin  //解决前端跨域访问：设置响应头运行跨域
@Api(value = "提供商品信息的接⼝",tags = "商品管理")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductCommontsService productCommontsService;

    @GetMapping("/detail-info/{pid}")
    @ApiOperation("商品基本信息查询接口")
    public ResultVO getProductInfo(@ApiParam(name = "pid",value = "商品id",required = true)
                                    @PathVariable("pid") String pid){
        return productService.productInfo(pid);
    }

    @GetMapping("/detail-params/{pid}")
    @ApiOperation("商品参数信息查询接口")
    public ResultVO getProductParams(@ApiParam(name = "pid",value = "商品id",required = true)
                                   @PathVariable("pid") String pid){
        return productService.productParams(pid);
    }

    @GetMapping("/detail-commonts/{pid}")
    @ApiOperation("商品评论信息查询接口")
    public ResultVO getProductCommonts(@ApiParam(name = "pid",value = "商品id",required = true)
                                       @PathVariable("pid") String pid,
                                       @ApiParam(name = "pageNum",value = "页码",required = true)
                                       int pageNum,
                                       @ApiParam(name = "limit",value = "一页显示条数",required = true)
                                       int limit){
        return productCommontsService.productCommonts(pid,pageNum,limit);
    }

    @GetMapping("/detail-type/{pid}")
    @ApiOperation("商品评论信息统计接口")
    public ResultVO getProductCommontsType(@ApiParam(name = "pid",value = "商品id",required = true)
                                     @PathVariable("pid") String pid){
        return productCommontsService.productCommontsType(pid);
    }

    @GetMapping("/listbycid/{cid}")
    @ApiOperation("根据类别查询商品接口")
    public ResultVO getProductsByThirdCategory(@ApiParam(name = "cid",value = "类别id",required = true)
                                           @PathVariable("cid") Integer cid,
                                               @ApiParam(name = "pageNum",value = "页码",required = true)
                                               int pageNum,
                                               @ApiParam(name = "limit",value = "一页显示条数",required = true)
                                               int limit){
        return productService.productsByThirdCategory(cid,pageNum,limit);
    }

    @ApiOperation("根据类别查询商品品牌接口")
    @GetMapping("/listbrands/{cid}")
    public ResultVO getBrandsByCategoryId(@PathVariable("cid") int cid){
        return productService.listBrands(cid);
    }

    @ApiOperation("根据关键字查询商品接口")
    @GetMapping("/listbykeyword")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = true),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "当前页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页显示条数",required = true)
    })
    public ResultVO searchProducts(String keyword,int pageNum,int limit){
        return productService.searchProduct(keyword,pageNum,limit);
    }

    @ApiOperation("根据关键字查询商品品牌接口")
    @GetMapping("/listbrands-keyword")
    @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = true)
    public ResultVO getBrandsByKeyword(String keyword){
        return productService.listBrands(keyword);
    }

    @GetMapping("/like/{cid}")
    @ApiOperation("猜你喜欢查询接口")
    public ResultVO getLikeTop6(@ApiParam(name = "cid",value = "一级分类id",required = true)
                                       @PathVariable("cid") Integer cid){
        return productService.productsByFirstCategory(cid);
    }
}
