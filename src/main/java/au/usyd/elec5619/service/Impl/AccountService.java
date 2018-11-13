package au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.dao.Impl.UserDAO;
import au.usyd.elec5619.entity.User;
import au.usyd.elec5619.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "accountService")
public class AccountService implements IAccountService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public User login(String username, String password) {
        return userDAO.getUser(username, password);
    }

    @Override
    public boolean isUsernameExist(String username) {
        User user = userDAO.getUserByUsername(username);
        if (user == null) {
            return false;
        }
        return true;
    }

    @Override
    public void addBuyer(String username, String password, String email) {
        User buyer = new User();
        buyer.setUsername(username);
        buyer.setPassword(password);
        buyer.setEmail(email);
        buyer.setType("B");
        userDAO.addBuyer(buyer);
    }

    @Override
    public void updateUser(int id, String username, String password, String email) {
        User user = userDAO.getUserById(id);
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setType("B");
        userDAO.updateUser(user, id);
    }

    @Override
    public String getEmail(String username) {
        return null;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }
}
