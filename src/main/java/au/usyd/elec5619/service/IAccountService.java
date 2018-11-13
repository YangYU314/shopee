package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.User;

public interface IAccountService {
    User login(String username, String password);

    boolean isUsernameExist(String username);

    void addBuyer(String username, String password, String email);

    void updateUser(int id, String username, String password, String email);

    String getEmail(String username);

    User getUserById(int id);

}
