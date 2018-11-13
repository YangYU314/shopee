package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.User;

import java.util.List;

public interface ICartService {
    void addToCart(Cart cart);

    List<Cart> getCartsByUserId(int uId);

    void updateItem(int user_id, int item_id, int qty);

    void deleteItem(int user_id, int item_id);

    Cart findItem(int user_id, int item_id);
}
