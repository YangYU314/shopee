package au.usyd.elec5619.dao;

import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.User;

import java.io.Serializable;
import java.util.List;

public interface ICartDAO extends Serializable {
    void addToCart(Cart cart);

    List<Cart> getCartByUser(int userId);

    Cart findItem(int user_id, int item_id);

    void updateItem(int user_id, int item_id, int qty);

    void deleteItem(int user_id, int item_id);
}
