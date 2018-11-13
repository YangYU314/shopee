package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.MobilePhone;

import java.util.List;

public interface IMobilePhoneService {
    List<MobilePhone> getAllMobilePhones();

    MobilePhone getMobilePhoneById(int id);

    List<MobilePhone> getMobilesByModel(String model);

    List<MobilePhone> getBestSellers();

    List<MobilePhone> getMobilesBySingleModel(String model);

    List<MobilePhone> mobilePhonesFilter(String model, List<String> colors, List<Integer> capacities, List<Integer> prices);

    List<String> getOnePropertyGroup(String property);

    void updatePhone(MobilePhone phone);

    void delete(int id);

    List<MobilePhone> getMobilePhoneByKeys(String key);
}
