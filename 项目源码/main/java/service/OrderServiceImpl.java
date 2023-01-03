package service;

import bean.Order;
import dao.order.OrderDao;
import dao.order.OrderDaoImpl;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    @Override
    public List<Order> showOrder(int user_id) {
        return orderDao.showOrder(user_id);
    }

    @Override
    public void orderUpdate(int user_id,int goods_id,int goods_num) {
        orderDao.orderUpdate( user_id, goods_id, goods_num);
    }
}
