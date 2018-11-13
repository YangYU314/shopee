package au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.IOrderDAO;
import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.Order_item;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository(value = "orderDAO")
@Transactional
public class OrderDAO implements IOrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void generateOrderBody(Order_body order_body) {
        this.sessionFactory.getCurrentSession().save(order_body);
    }

    @Override
    public List<Order_body> getOrdersByUser(int user_id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Order_body WHERE user_id=:uId order by date";
        Query query = currentSession.createQuery(hql).setParameter("uId", user_id);
        List<Order_body> orders = query.list();
        if (orders.isEmpty()) {
            return null;
        } else {
            return orders;
        }
    }

    @Override
    public List<Order_item> getOrderItemsByOrder_id(int order_id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Order_item WHERE body_id=:bId";
        Query query = currentSession.createQuery(hql).setParameter("bId", order_id);
        List<Order_item> items = query.list();
        if (items.isEmpty()) {
            return null;
        } else {
            return items;
        }
    }

    @Override
    public Order_body getOrderBody(int user_id, Date date) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Order_body WHERE user_id=:uId and date = :date";
        Query query = currentSession.createQuery(hql).setParameter("uId", user_id).setParameter("date", date);
        List<Order_body> orders = query.list();
        if (orders.isEmpty()) {
            return null;
        } else {
            return orders.get(0);
        }
    }

    @Override
    public Order_body getOrderBodyById(int id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Order_body WHERE id=:id";
        Query query = currentSession.createQuery(hql).setParameter("id", id);
        List<Order_body> orders = query.list();
        if (orders.isEmpty()) {
            return null;
        } else {
            return orders.get(0);
        }
    }

    @Override
    public void generateOrderItem(Order_item order_item) {
        this.sessionFactory.getCurrentSession().save(order_item);
    }

//    @Override
//    public List<Ord> getOrdersByUser(int userId) {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        String hql = "FROM Ord WHERE user_id=:uId";
//        Query query = currentSession.createQuery(hql).setParameter("uId", userId);
//        List<Ord> orders = query.list();
//        if (orders.isEmpty()) {
//            return null;
//        } else {
//            return orders;
//        }
//    }
}
