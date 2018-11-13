package au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.dao.Impl.OrderDAO;
import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.Order_item;
import au.usyd.elec5619.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service(value = "orderService")
public class OrderService implements IOrderService {

    @Autowired
    private OrderDAO orderDAO;

//    @Override
//    public void generateOrder(Ord order) {
//        orderDAO.generateOrder(order);
//    }
//
//    @Override
//    public List<Ord> getOrdersByUserId(int uId) {
//        return orderDAO.getOrdersByUser(uId);
//    }


    @Override
    public void generateOrderBody(Order_body order_body) {
        orderDAO.generateOrderBody(order_body);
    }

    @Override
    public Order_body getOrderBody(int user_id, Date date) {
        return orderDAO.getOrderBody(user_id, date);
    }

    @Override
    public void generateOrderItem(Order_item order_item) {
        orderDAO.generateOrderItem(order_item);
    }

    @Override
    public List<Order_body> getOrdersByUser(int user_id) {
        return orderDAO.getOrdersByUser(user_id);
    }

    @Override
    public List<Order_item> getOrderItemsByOrder_id(int order_id) {
        return orderDAO.getOrderItemsByOrder_id(order_id);
    }

    @Override
    public Order_body getOrderBodyById(int id) {
        return orderDAO.getOrderBodyById(id);
    }
}
