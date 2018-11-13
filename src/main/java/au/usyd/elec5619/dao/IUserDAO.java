package au.usyd.elec5619.dao;

import au.usyd.elec5619.entity.User;

import java.io.Serializable;
import java.util.List;

public interface IUserDAO extends Serializable {
    void addBuyer(User buyer);

    void updateUser(User user, int id);

    //
//    void deleteBuyer(int id);
//
//    void updateBuyer(User newBuyer);
//
//    List<User> getBuyers();
//
    User getUserByUsername(String username);
//
//    User getBuyerById(int Id);

    User getUser(String username, String password);

    User getUserById(int id);

    String getEmail(String username);
}
