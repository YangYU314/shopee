package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.entity.Order_body;
import au.usyd.elec5619.entity.User;
import au.usyd.elec5619.service.IAccountService;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import au.usyd.elec5619.service.Impl.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/account/**")
public class AccountController {

    @Resource(name = "accountService")
    private IAccountService accountService;

    @Resource(name = "mobilePhoneService")
    private MobilePhoneService mobilePhoneService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/login.action")
    public ModelAndView login(HttpServletRequest httpServletRequest, Model uiModel) {
        String username = httpServletRequest.getParameter("username");
        String pwd = httpServletRequest.getParameter("password");
        User user = accountService.login(username, pwd);
        if (user != null) {
            httpServletRequest.getSession().setAttribute("userid", user.getId());
            httpServletRequest.getSession().setAttribute("username", user.getUsername());
            httpServletRequest.getSession().setAttribute("email", user.getEmail());
            httpServletRequest.getSession().setAttribute("password", user.getPassword());
            List<MobilePhone> mobilePhones;
            mobilePhones = mobilePhoneService.getBestSellers();
            if (user.getType().equals("B")) {
                return new ModelAndView("home-buyer", "bestSellers", mobilePhones);
            } else if (user.getType().equals("A")) {
                return new ModelAndView("redirect:/home-admin");
//                return new ModelAndView("redirect:/home-admin");
            }
        }
        return new ModelAndView("fail");
    }


    @RequestMapping(value = "/setting")
    public ModelAndView setting(HttpSession httpSession) {
        int user_id = Integer.parseInt(String.valueOf(httpSession.getAttribute("userid")));
        List<Order_body> order_bodies = orderService.getOrdersByUser(user_id);
        System.out.println(order_bodies);
        ModelAndView setting_mv = new ModelAndView("setting", "order_bodies", order_bodies);
        return setting_mv;
    }

    //for user setting
    @RequestMapping(value = "/updateUserSetting.action")
    public ModelAndView updateUserSetting(HttpServletRequest httpServletRequest) {
        ModelAndView updateUserSettingMV = new ModelAndView("update_succeed");
        //System.out.println("what in session "+httpServletRequest.getSession().getAttribute("id"));
        int id = (int) (httpServletRequest.getSession().getAttribute("userid"));

        String username = httpServletRequest.getParameter("username_signUp");
        String password = httpServletRequest.getParameter("password_signUp");
        String email = httpServletRequest.getParameter("email");
        //accountService.addBuyer(username, password, email);
        accountService.updateUser(id, username, password, email);
        httpServletRequest.getSession().setAttribute("username", username);
        //System.out.print("updateUserSettingSession:"+httpServletRequest.getSession());
        return updateUserSettingMV;
    }
//
//    @RequestMapping(value="/profile")
//    public ModelAndView profile(HttpServletRequest httpServletRequest){
//        ModelAndView profile_mv=new ModelAndView();
//        httpServletRequest.getSession().getAttribute("order");
////        profile_mv.put("username",username);
////        profile_mv.put("order",order_id);
//        return profile_mv;
//    }-

    @RequestMapping(value = "/checkUsername.action", method = RequestMethod.POST)
    @ResponseBody
    public String checkUsername(String username) {
        if (accountService.isUsernameExist(username)) {
            return "exist";
        }
        return "null";
    }

    @RequestMapping(value = "/signUp.action", method = RequestMethod.POST)
    public String signUp(HttpServletRequest requset) {
        String username = requset.getParameter("username_signUp");
        String password = requset.getParameter("password_signUp");
        String email = requset.getParameter("email");
        accountService.addBuyer(username, password, email);
        requset.getSession().setAttribute("username", username);
        return "sign-up-success";
    }

    @RequestMapping(value = "/signOut.action", method = RequestMethod.GET)
    public String signUp(HttpSession session) {
        session.invalidate();
        return "login";
    }


//
//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
//    public String editProduct(@PathVariable("id") Long id, Model uiModel) {
//        Product product = this.productManager.getProductById(id);
//        uiModel.addAttribute("product", product);
//        return "edit";
//    }
//
//    @RequestMapping(value = "/edit/**", method = RequestMethod.POST)
//    public String editProduct(@Valid Product product) {
//        this.productManager.updateProduct(product);
//        System.out.println(product.getId());
//        return "redirect:/hello.htm";
//    }
//
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
//    public String deleteProduct(@PathVariable("id") Long id) {
//        this.productManager.deleteProduct(id);
//        return "redirect:/hello.htm";
//    }
}