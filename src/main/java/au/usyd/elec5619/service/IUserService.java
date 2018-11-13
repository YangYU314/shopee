package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.User;

public interface IUserService {
    boolean addBuyer(User buyer);

    void deleteBuyer(int id);

    void updateBuyer(User buyer);

    User getBuyers();

    User getBuyerByUsername();
}
