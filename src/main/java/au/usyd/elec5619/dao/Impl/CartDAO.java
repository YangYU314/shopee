package au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.ICartDAO;
import au.usyd.elec5619.entity.Cart;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "cartDAO")
@Transactional
public class CartDAO implements ICartDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Cart> getCartByUser(int user_id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Cart WHERE user_id=:uId";
        Query query = currentSession.createQuery(hql).setParameter("uId", user_id);
        List<Cart> carts = query.list();
        if (carts.isEmpty()) {
            return null;
        } else {
            return carts;
        }
    }

    @Override
    public Cart findItem(int user_id, int item_id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Cart WHERE user_id=:uId and item_id=:iId";
        Query query = currentSession.createQuery(hql).setParameter("uId", user_id).setParameter("iId", item_id);
        List<Cart> carts = query.list();
        if (carts.isEmpty()) {
            return null;
        } else {
            return carts.get(0);
        }
    }

    @Override
    public void updateItem(int user_id, int item_id, int qty) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        currentSession.beginTransaction();
        String hql = "update Cart c set c.qty=:qty WHERE user_id=:uId and item_id=:iId";
        Query query = currentSession.createQuery(hql).setParameter("uId", user_id).setParameter("iId", item_id).setParameter("qty", qty);
        query.executeUpdate();
        currentSession.getTransaction().commit();
    }

    @Override
    public void deleteItem(int user_id, int item_id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        Cart cart = this.findItem(user_id, item_id);
        currentSession.delete(cart);
    }
//
//    @Override
//    public void updateBuyer(User newBuyer) {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        currentSession.merge(newBuyer);
//    }
//
//    @Override
//    public List<User> getBuyers() {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        String hql = "FROM Buyer";
//        Query query = currentSession.createQuery(hql);
//        List<User> buyers = query.list();
//        return buyers;
//    }
//

    @Override
    public void addToCart(Cart cart) {
        this.sessionFactory.getCurrentSession().save(cart);
    }
//
//    @Override
//    public User getBuyerById(int Id) {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        String hql = "FROM Buyer WHERE Id=:id";
//        Query query = currentSession.createQuery(hql).setParameter("id", Id);
//        List<User> buyers = query.list();
//        if (buyers.isEmpty()) {
//            return null;
//        } else {
//            return buyers.get(0);
//        }
//    }
//
//    @Override
//    public User buyerLogin(String username, String password) {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        String hql = "FROM Buyer WHERE Username=:username and Password=:pwd";
//        Query query = currentSession.createQuery(hql).setParameter("username", username).setParameter("pwd", password);
//        List<User> buyers = query.list();
//        if (buyers.isEmpty()) {
//            return null;
//        } else {
//            return buyers.get(0);
//        }
//    }

}
