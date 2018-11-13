package au.usyd.elec5619.dao;

import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.Order_item;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public interface IOrderDAO extends Serializable {
    void generateOrderBody(Order_body order_body);

    List<Order_body> getOrdersByUser(int user_id);

    List<Order_item> getOrderItemsByOrder_id(int order_id);

    Order_body getOrderBody(int user_id, Date date);

    Order_body getOrderBodyById(int id);

    void generateOrderItem(Order_item order_item);

//    List<Ord> getOrdersByUser(int userId);
}
