package au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.IMobilePhoneDAO;
import au.usyd.elec5619.entity.MobilePhone;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "mobilePhoneDAO")
@Transactional
public class MobilePhoneDAO implements IMobilePhoneDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<MobilePhone> getAllMobilePhones() {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone order by price,capacity";
        Query query = currentSession.createQuery(hql);
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public MobilePhone getMobilePhoneById(int id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where id = :id";
        Query query = currentSession.createQuery(hql).setParameter("id", id);
        MobilePhone mobilePhone = (MobilePhone) query.uniqueResult();
        if (mobilePhone == null) {
            return null;
        } else {
            return mobilePhone;
        }
    }

    @Override
    public List<MobilePhone> getMobilePhoneByKeys(String key) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model like :model or brand like :model or capacity like :model or color like :model order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", "%" + key + "%");
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<String> getPropertiesByType(String property) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "SELECT " + property + " From MobilePhone group by " + property + " order by " + property + " asc ";
        Query query = currentSession.createQuery(hql);
        List<String> capacities = query.list();
        if (capacities.isEmpty()) {
            return null;
        } else {
            return capacities;
        }
    }

    @Override
    public List<MobilePhone> getMobilePhonesByModel(String model) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model like :model order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model + "%");
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> getBestSellers() {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone order by sales desc ";
        Query query = currentSession.createQuery(hql).setFirstResult(0).setMaxResults(4);
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> getMobilePhonesBySingleModel(String model) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model =:model order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model);
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> mobilePhonesFilter(String model, List<String> colors, List<Integer> capacities, List<Integer> prices) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model =:model and color in (:colors) and capacity in (:capacities) and price between :low and :high order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model).setParameterList("colors", colors).setParameterList("capacities", capacities)
                .setParameter("low", prices.get(0)).setParameter("high", prices.get(1));
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> mobilePhonesFilterColors(String model, List<String> colors, List<Integer> prices) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model =:model and color in (:colors) and price between :low and :high order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model).setParameterList("colors", colors)
                .setParameter("low", prices.get(0)).setParameter("high", prices.get(1));
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> mobilePhonesFilterCapacities(String model, List<Integer> capacities, List<Integer> prices) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model =:model and capacity in (:capacities) and price between :low and :high order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model).setParameterList("capacities", capacities)
                .setParameter("low", prices.get(0)).setParameter("high", prices.get(1));
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public List<MobilePhone> mobilePhonesFilterPrices(String model, List<Integer> prices) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        String hql = "FROM MobilePhone where model =:model and price between :low and :high order by price,capacity";
        Query query = currentSession.createQuery(hql).setParameter("model", model)
                .setParameter("low", prices.get(0)).setParameter("high", prices.get(1));
        List<MobilePhone> mobilePhones = query.list();
        if (mobilePhones.isEmpty()) {
            return null;
        } else {
            return mobilePhones;
        }
    }

    @Override
    public void updatePhone(MobilePhone phone) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        currentSession.merge(phone);
    }

    @Override
    public void delete(int id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        MobilePhone mobilePhone = this.getMobilePhoneById(id);
        currentSession.delete(mobilePhone);
    }
}
