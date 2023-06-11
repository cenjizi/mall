package com.kzh.controller;

import com.github.wxpay.sdk.WXPayUtil;
import com.kzh.service.OrderService;
import com.kzh.websocket.WebSocketServer;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/pay")
@Api(value = "提供支付回调的相关接口",tags = "支付管理")
public class PayController {

    @Autowired
    private OrderService orderService;

    /**
     * 回调接口:当用户支付成功之后，微信支付平台就会请求这个接口，将支付状态的数据传递过来
     */
    @RequestMapping("/callback")
    @ApiOperation("支付完成后的回调方法接口")
    public String paySuccess(HttpServletRequest request) throws Exception {
        System.out.println("--------------------callback");
        // 1.接收微信支付平台传递的数据（使用request的输入流接收）
        ServletInputStream is = request.getInputStream();
        byte[] bs = new byte[1024];
        int len = -1;
        StringBuilder builder = new StringBuilder();
        while((len = is.read(bs))!=-1){
            builder.append(new String(bs,0,len));
        }
        String s = builder.toString();
        //使用帮助类将xml接口的字符串装换成map
        Map<String, String> map = WXPayUtil.xmlToMap(s);

        if(map!=null && "success".equalsIgnoreCase(map.get("result_code"))){
            //支付成功
            //2.修改订单状态为“待发货/已支付”
            String orderId = map.get("out_trade_no");
            int i = orderService.updateOrderStatus(orderId, "2");
            System.out.println("--orderId:"+orderId);
            //3.通过websocket连接，向前端推送消息
            WebSocketServer.sendMsg(orderId,"1");

            //4.响应微信支付平台
            if(i>0){
                HashMap<String,String> resp = new HashMap<>();
                resp.put("return_code","success");
                resp.put("return_msg","OK");
                resp.put("appid",map.get("appid"));
                resp.put("result_code","success");
                return WXPayUtil.mapToXml(resp);
            }
        }
        return null;
    }

}
