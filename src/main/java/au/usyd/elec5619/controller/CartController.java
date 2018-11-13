package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.service.Impl.CartService;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {

    @Autowired
    CartService cartService;

    @Autowired
    MobilePhoneService mobilePhoneService;

    @RequestMapping(value = "/showCart")
    public ModelAndView showCart(HttpSession httpSession) {
        int userId = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        List<Cart> carts = cartService.getCartsByUserId(userId);
        int number = carts.size();
        int totalPrice = 0;
        List<MobilePhone> mobilePhones = new ArrayList<>();
        List<Integer> numbers = new ArrayList<>();
        Map<String, Object> myModel = new HashMap<String, Object>();
        for (Cart cart : carts) {
            MobilePhone mobilePhone = mobilePhoneService.getMobilePhoneById(cart.getItem_id());
            mobilePhones.add(mobilePhone);
            numbers.add(cart.getQty());
            totalPrice += (mobilePhone.getPrice() * cart.getQty());
        }
        myModel.put("mobiles", mobilePhones);
        myModel.put("qtys", numbers);
        myModel.put("totalNumber", number);
        myModel.put("totalPrice", totalPrice);
        return new ModelAndView("cart", "items", myModel);
    }

    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String addToCart(@PathVariable("id") int item_id, HttpSession httpSession) {
        int user_id = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        Cart cart = cartService.findItem(user_id, item_id);
        if (cart != null) {
            return "Already in your cart!";
        } else {
            Cart newCart = new Cart();
            newCart.setItem_id(item_id);
            newCart.setUser_id(user_id);
            newCart.setQty(1);
            cartService.addToCart(newCart);
            return "Add to Cart Success!";
        }
    }

    @RequestMapping(value = "/changeQty", method = RequestMethod.POST)
    public void increaseQty(@RequestParam("item_id") int item_id, @RequestParam("qty") int qty, HttpSession httpSession) {
        int user_id = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        cartService.updateItem(user_id, item_id, qty);
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.POST)
    public void removeItem(@PathVariable("id") int item_id, HttpSession httpSession) {
        int user_id = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        cartService.deleteItem(user_id, item_id);
    }
}
