package au.usyd.elec5619.dao;

import au.usyd.elec5619.entity.MobilePhone;

import java.util.List;

public interface IMobilePhoneDAO {
    List<MobilePhone> getAllMobilePhones();

    void updatePhone(MobilePhone phone);

    void delete(int id);

    MobilePhone getMobilePhoneById(int id);

    List<MobilePhone> getMobilePhoneByKeys(String key);

    List<String> getPropertiesByType(String property);

    List<MobilePhone> getMobilePhonesByModel(String model);

    List<MobilePhone> getBestSellers();

    List<MobilePhone> getMobilePhonesBySingleModel(String model);

    List<MobilePhone> mobilePhonesFilter(String model, List<String> colors, List<Integer> capacities, List<Integer> prices);

    List<MobilePhone> mobilePhonesFilterColors(String model, List<String> colors, List<Integer> prices);

    List<MobilePhone> mobilePhonesFilterCapacities(String model, List<Integer> capacities, List<Integer> prices);

    List<MobilePhone> mobilePhonesFilterPrices(String model, List<Integer> prices);
}
