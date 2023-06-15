package com.kzh.service.job;

import com.github.wxpay.sdk.WXPay;
import com.kzh.dao.OrdersMapper;
import com.kzh.entity.Orders;
import com.kzh.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class OrderTimeoutCheckJob {

    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderService orderService;

    private WXPay wxPay = new WXPay(new MyPayConfig());

    @Scheduled(cron = "0/5 * * * * ?")
//    @Scheduled(cron = "0 0/10 * * * ?")
    public void checkAndCloseOrder() {
        System.out.println("-------------------11");
        try {
            //1.查询超过30min订单状态依然为待支付状态的订单
            Example example = new Example(Orders.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("status", "1");
            Date time = new Date(System.currentTimeMillis() - 30 * 60 * 1000);
            criteria.andLessThan("createTime", time);
            List<Orders> orders = ordersMapper.selectByExample(example);

            //2.访问微信平台接口，确认当前订单最终的支付状态
            for (int i = 0; i < orders.size(); i++) {
                Orders order = orders.get(i);
                HashMap<String, String> params = new HashMap<>();
                params.put("out_trade_no", order.getOrderId());

                Map<String, String> resp = wxPay.orderQuery(params);

                if("SUCCESS".equalsIgnoreCase(resp.get("trade_state"))){
                    //2.1 如果订单已经支付，则修改订单状态为"待发货/已支付"  status = 2
                    Orders updateOrder = new Orders();
                    updateOrder.setOrderId(order.getOrderId());
                    updateOrder.setStatus("2");
                    ordersMapper.updateByPrimaryKeySelective(updateOrder);
                }else if("NOTPAY".equalsIgnoreCase(resp.get("trade_state"))){
                    //2.2 如果确实未支付 则取消订单：
                    //a.向微信支付平台发送请求，关闭当前订单的支付链接
                    Map<String, String> map = wxPay.closeOrder(params);
                    System.out.println(map);

                    //b.关闭订单
                    orderService.closeOrder(order.getOrderId());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
