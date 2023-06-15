package com.kzh.controller;

import com.github.wxpay.sdk.WXPay;
import com.kzh.config.MyPayConfig;
import com.kzh.entity.Orders;
import com.kzh.service.OrderService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/order")
@Api(value = "提供订单相关的操作接口",tags = "订单管理")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    @ApiOperation("订单添加接口")
    public ResultVO add(String cids, @RequestBody Orders order){
        ResultVO resultVO = null;
        try {
            Map<String, String> orderInfo = orderService.addOrder(cids, order);
            if(orderInfo!=null){
                String orderId = orderInfo.get("orderId");
                //设置当前订单信息
                HashMap<String,String> data = new HashMap<>();
                data.put("body",orderInfo.get("productNames"));  //商品描述
                data.put("out_trade_no",orderId);               //使用当前用户订单的编号作为当前支付交易的交易号
                data.put("fee_type","CNY");                     //支付币种
//                data.put("total_fee",order.getActualAmount()*100+"");          //支付金额
                data.put("total_fee","1");
                data.put("trade_type","NATIVE");                //交易类型
                data.put("notify_url","http://8smaj3.natappfree.cc/pay/callback");   //设置支付完成后的回调方法接口

                //发送请求，获取响应
                //微信支付：申请支付连接
                WXPay wxPay = new WXPay(new MyPayConfig());
                Map<String, String> resp = wxPay.unifiedOrder(data);
                orderInfo.put("payUrl",resp.get("code_url"));
                //orderInfo中包含：订单编号，购买的商品名称，支付链接
                resultVO = new ResultVO(ResStatus.OK,"提交订单成功！",orderInfo);
            }else{
                resultVO = new ResultVO(ResStatus.NO,"商品库存不足！",null);
            }
        } catch (SQLException e) {
            resultVO = new ResultVO(ResStatus.NO,"提交订单失败！",null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultVO;
    }

    @GetMapping("/status/{oid}")
    @ApiOperation("订单状态查询接口")
    public ResultVO getOrderStatus(@PathVariable("oid") String orderId,
                                   @RequestHeader("token")String token){
        ResultVO resultVO = orderService.getOrderById(orderId);
        return resultVO;
    }

    @GetMapping("/list")
    @ApiOperation("订单列表查询接口")
    public ResultVO list(@RequestHeader("token")String token,
                         @ApiParam(name = "userId",value = "用户ID",required = true) String userId,
                         @ApiParam(name = "status",value = "订单状态",required = false) String status,
                         @ApiParam(name = "pageNum",value = "页码",required = true) int pageNum,
                         @ApiParam(name = "limit",value = "每页条数",required = true) int limit){
        ResultVO resultVO = orderService.listOrders(userId, status, pageNum, limit);
        return resultVO;
    }

}
