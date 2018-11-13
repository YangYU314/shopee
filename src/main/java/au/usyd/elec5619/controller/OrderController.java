package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.Order_item;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import au.usyd.elec5619.service.Impl.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    MobilePhoneService mobilePhoneService;

    @RequestMapping(value = "/checkOut", method = RequestMethod.POST)
    public ModelAndView checkOut(@RequestParam("totalPrice") Integer totalPrice, @RequestParam("qtys[]") List<Integer> qtys, @RequestParam("itmeIds[]") List<Integer> itmeIds) {
        List<MobilePhone> mobilePhones = new ArrayList<>();
        for (int id : itmeIds) {
            mobilePhones.add(mobilePhoneService.getMobilePhoneById(id));
        }
        int totalItems = 0;
        for (int i = 0; i < qtys.size(); i++) {
            totalItems += qtys.get(i);
        }
        int totalPhones = qtys.size();
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobiles", mobilePhones);
        myModel.put("qtys", qtys);
        myModel.put("totalItems", totalItems);
        myModel.put("totalPhones", totalPhones);
        myModel.put("totalPrice", totalPrice);
        return new ModelAndView("order", "checkoutInfo", myModel);
    }

    @RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
    public ModelAndView checkOut(@RequestParam("price") int totalPrice,
                                 @RequestParam("street") String street,
                                 @RequestParam("delivery") String delivery,
                                 @RequestParam("receiver") String receiver,
                                 @RequestParam("phone") String phone,
                                 @RequestParam("city") String city,
                                 @RequestParam("state") String state,
                                 @RequestParam("qtys[]") List<Integer> qtys,
                                 @RequestParam("ids[]") List<Integer> itmeIds,
                                 HttpSession httpSession) {
        List<MobilePhone> mobilePhones = new ArrayList<>();
        int user_id = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        for (int id : itmeIds) {
            mobilePhones.add(mobilePhoneService.getMobilePhoneById(id));
        }
        int totalItems = 0;
        for (int i = 0; i < qtys.size(); i++) {
            totalItems += qtys.get(i);
        }
        Date date = new Date();
        Order_body order_body = new Order_body();
        order_body.setUser_id(user_id);
        order_body.setPrice(totalPrice);
        order_body.setStreet(street);
        order_body.setReceiver(receiver);
        order_body.setPhone(phone);
        order_body.setDate(date);
        order_body.setDelivery_time(delivery);
        order_body.setCity(city);
        order_body.setState(state);
        orderService.generateOrderBody(order_body);
        Order_body thisBody = orderService.getOrderBody(user_id, date);
        int order_id = thisBody.getId();
        for (int i = 0; i < itmeIds.size(); i++) {
            Order_item order_item = new Order_item();
            order_item.setBody_id(order_id);
            order_item.setItem_id(itmeIds.get(i));
            order_item.setQty(qtys.get(i));
            orderService.generateOrderItem(order_item);
        }

        List<Order_body> order_bodies = orderService.getOrdersByUser(user_id);
//        int totalPhones = qtys.size();
//        Map<String, Object> myModel = new HashMap<String, Object>();
//        myModel.put("mobiles", mobilePhones);
//        myModel.put("qtys", qtys);
//        myModel.put("totalItems", totalItems);
//        myModel.put("totalPhones", totalPhones);
//        myModel.put("totalPrice", totalPrice);
        return new ModelAndView("setting", "order_bodies", order_bodies);
    }

    @RequestMapping(value = "/showItems/{id}", method = RequestMethod.GET)
    public ModelAndView showItems(@PathVariable("id") int order_id) {
        Map<String, Object> myModel = new HashMap<String, Object>();
        Order_body order_body = orderService.getOrderBodyById(order_id);
        System.out.println(order_body.getId());
        List<Order_item> items = orderService.getOrderItemsByOrder_id(order_body.getId());
        List<MobilePhone> mobilePhones = new ArrayList<>();
        for (Order_item item : items) {
            MobilePhone mobilePhone = mobilePhoneService.getMobilePhoneById(item.getItem_id());
            mobilePhones.add(mobilePhone);
        }
        myModel.put("order", order_body);
        myModel.put("items", items);
        myModel.put("mobiles", mobilePhones);
        myModel.put("totalPhones", mobilePhones.size());
        return new ModelAndView("order-show", "checkoutInfo", myModel);
    }
}