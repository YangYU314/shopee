package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.Order_item;

import java.util.Date;
import java.util.List;

public interface IOrderService {
    void generateOrderBody(Order_body order_body);

    Order_body getOrderBody(int user_id, Date date);

    void generateOrderItem(Order_item order_item);

    List<Order_body> getOrdersByUser(int user_id);

    List<Order_item> getOrderItemsByOrder_id(int order_id);

    Order_body getOrderBodyById(int id);
}
