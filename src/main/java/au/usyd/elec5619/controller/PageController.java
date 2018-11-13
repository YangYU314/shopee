package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.entity.User;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class PageController {
    @Autowired
    private MobilePhoneService mobilePhoneService;

    @RequestMapping(value = "/login.htm")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/home-buyer.htm")
    public ModelAndView getBestSellers() {
        List<MobilePhone> mobilePhones;
        mobilePhones = mobilePhoneService.getBestSellers();
        return new ModelAndView("home-buyer", "bestSellers", mobilePhones);
    }

    @RequestMapping(value = "/home-admin")
    public String showAdminPage() {
        return "home-admin";
    }

}
