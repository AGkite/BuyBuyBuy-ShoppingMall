package service;

import bean.Order;

import java.util.List;

public interface OrderService {
    //查看个人的商品订单
    List<Order> showOrder(int user_id);
    //存入商品订单
    void orderUpdate(int user_id,int goods_id,int goods_num);
}
