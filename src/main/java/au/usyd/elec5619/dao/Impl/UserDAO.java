package au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.IUserDAO;
import au.usyd.elec5619.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "userDAO")
@Transactional
public class UserDAO implements IUserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User getUser(String username, String password) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM User WHERE username=:username and password=:pwd";
        Query query = currentSession.createQuery(hql).setParameter("username", username).setParameter("pwd", password);
        List<User> users = query.list();
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    @Override
    public String getEmail(String username) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        System.out.print("getEmail+" + username);
        String hql = "FROM User WHERE username=:username";
        Query query = currentSession.createQuery(hql).setParameter("username", username);
        List<User> users = query.list();
        if (users.isEmpty()) {
            System.out.print("fuck u its emplty");
            return null;
        } else {
            System.out.print("userdao email" + users.get(0).getEmail());
            return users.get(0).getEmail();
        }
    }


    @Override
    public void addBuyer(User newBuyer) {
        this.sessionFactory.getCurrentSession().save(newBuyer);
    }

    @Override
    public void updateUser(User user, int id) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(user);
//        Session session =null;
//        session =sessionFactory.getCurrentSession();
//        session.beginTransaction();
//        session.update(user);
//        session.getTransaction().commit();
//        this.sessionFactory.getCurrentSession().beginTransaction();
//        this.sessionFactory.getCurrentSession().load(user,id);
//        this.sessionFactory.getCurrentSession().getTransaction().commit();
    }

    //
//    @Override
//    public void deleteBuyer(int id) {
//        Session currentSession = this.sessionFactory.getCurrentSession();
//        User product = (User) currentSession.get(User.class, id);
//        currentSession.delete(product);
//    }
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
    public User getUserByUsername(String username) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM User WHERE Username=:username";
        Query query = currentSession.createQuery(hql).setParameter("username", username);
        List<User> users = query.list();
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    //
    @Override
    public User getUserById(int Id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM User WHERE Id=:id";
        Query query = currentSession.createQuery(hql).setParameter("id", Id);
        List<User> users = query.list();
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }
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
