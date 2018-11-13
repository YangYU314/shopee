package au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.dao.Impl.MobilePhoneDAO;
import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.service.IMobilePhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "mobilePhoneService")
public class MobilePhoneService implements IMobilePhoneService {

    @Autowired
    MobilePhoneDAO mobilePhoneDAO;

    @Override
    public List<MobilePhone> getAllMobilePhones() {
        return mobilePhoneDAO.getAllMobilePhones();
    }

    @Override
    public MobilePhone getMobilePhoneById(int id) {
        return mobilePhoneDAO.getMobilePhoneById(id);
    }

    @Override
    public List<MobilePhone> getMobilesByModel(String model) {
        return mobilePhoneDAO.getMobilePhonesByModel(model);
    }

    @Override
    public List<MobilePhone> getBestSellers() {
        return mobilePhoneDAO.getBestSellers();
    }

    @Override
    public List<MobilePhone> getMobilesBySingleModel(String model) {
        return mobilePhoneDAO.getMobilePhonesBySingleModel(model);
    }

    @Override
    public List<MobilePhone> mobilePhonesFilter(String model, List<String> colors, List<Integer> capacities, List<Integer> prices) {
        if (colors != null && capacities != null) {
            return mobilePhoneDAO.mobilePhonesFilter(model, colors, capacities, prices);
        }
        if (colors == null && capacities == null) {
            return mobilePhoneDAO.mobilePhonesFilterPrices(model, prices);
        }
        if (colors != null && capacities == null) {
            return mobilePhoneDAO.mobilePhonesFilterColors(model, colors, prices);
        }
        if (colors == null && capacities != null) {
            return mobilePhoneDAO.mobilePhonesFilterCapacities(model, capacities, prices);
        }
        return null;
    }

    @Override
    public List<String> getOnePropertyGroup(String property) {
        return mobilePhoneDAO.getPropertiesByType(property);
    }

    @Override
    public void updatePhone(MobilePhone phone) {
        mobilePhoneDAO.updatePhone(phone);
    }

    @Override
    public void delete(int id) {
        mobilePhoneDAO.delete(id);
    }

    @Override
    public List<MobilePhone> getMobilePhoneByKeys(String key) {
        return getMobilePhoneByKeys(key);
    }
}
