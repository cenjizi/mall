package com.kzh.service;

import com.kzh.entity.Orders;
import com.kzh.vo.ResultVO;

import java.sql.SQLException;
import java.util.Map;

public interface OrderService {
    public Map<String,String> addOrder(String cids, Orders order) throws SQLException;

    public int updateOrderStatus(String orderId, String status);

    public ResultVO getOrderById(String orderId);

    public void closeOrder(String orderId);

    public ResultVO listOrders(String userId,String status,int pageNum, int limit);
}
