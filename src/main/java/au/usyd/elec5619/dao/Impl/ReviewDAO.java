package au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.IReviewDAO;
import au.usyd.elec5619.entity.Review;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "reviewDAO")
@Transactional
public class ReviewDAO implements IReviewDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Review> getReviewsByMobile(int mobileId) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM Review where mobilePhone_id = :Pid";
        Query query = currentSession.createQuery(hql).setParameter("Pid", mobileId);
        List<Review> reviews = query.list();
        if (reviews == null) {
            return null;
        } else {
            return reviews;
        }
    }
}
