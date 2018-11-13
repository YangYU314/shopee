package au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.dao.Impl.CartDAO;
import au.usyd.elec5619.dao.Impl.UserDAO;
import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.User;
import au.usyd.elec5619.service.IAccountService;
import au.usyd.elec5619.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "cartService")
public class CartService implements ICartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public void addToCart(Cart cart) {
        cartDAO.addToCart(cart);
    }

    @Override
    public List<Cart> getCartsByUserId(int uId) {
        return cartDAO.getCartByUser(uId);
    }

    @Override
    public void updateItem(int user_id, int item_id, int qty) {
        cartDAO.updateItem(user_id, item_id, qty);
    }

    @Override
    public void deleteItem(int user_id, int item_id) {
        cartDAO.deleteItem(user_id, item_id);
    }

    @Override
    public Cart findItem(int user_id, int item_id) {
        return cartDAO.findItem(user_id, item_id);
    }
}
