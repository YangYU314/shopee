package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/**")
public class AdminController {
    @Autowired
    private MobilePhoneService mobilePhoneService;

    @RequestMapping(value = "/manageItems")
    public ModelAndView getAllPhones() {
        List<MobilePhone> mobilePhones;
        mobilePhones = mobilePhoneService.getAllMobilePhones();
        System.out.println(mobilePhones.size());
        return new ModelAndView("manage-mobilePhone", "allPhones", mobilePhones);
    }

    @RequestMapping(value = "/showAdd")
    public String showAddPage() {
        return "add-mobilePhone";
    }

    @RequestMapping(value = "/update/{id}")
    public ModelAndView detailedInfo(@PathVariable("id") int id) {
        MobilePhone mobilePhone = mobilePhoneService.getMobilePhoneById(id);
        return new ModelAndView("update-mobilePhone", "mobileInfo", mobilePhone);
    }

    @RequestMapping(value = "/updating/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String checkOut(@PathVariable("id") int id, @RequestParam("brand") String brand,
                           @RequestParam("model") String model,
                           @RequestParam("capacity") int capacity,
                           @RequestParam("color") String color,
                           @RequestParam("price") int price,
                           @RequestParam("photo") String photo,
                           @RequestParam("abstracts") String abstracts,
                           @RequestParam("description") String description) {
        MobilePhone oldPhone = mobilePhoneService.getMobilePhoneById(id);
        MobilePhone mobilePhone = new MobilePhone();
        mobilePhone.setId(id);
        mobilePhone.setBrand(brand);
        mobilePhone.setModel(model);
        mobilePhone.setCapacity(capacity);
        mobilePhone.setColor(color);
        mobilePhone.setPrice(price);
        mobilePhone.setAbstracts(abstracts);
        mobilePhone.setDescription(description);
        System.out.println(photo);
        if (photo.isEmpty()) {
            mobilePhone.setPhoto(oldPhone.getPhoto());
        } else {
            mobilePhone.setPhoto(photo);
        }
        mobilePhoneService.updatePhone(mobilePhone);
        return "success";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String checkOut(@RequestParam("brand") String brand,
                           @RequestParam("model") String model,
                           @RequestParam("capacity") int capacity,
                           @RequestParam("color") String color,
                           @RequestParam("price") int price,
                           @RequestParam("photo") String photo,
                           @RequestParam("abstracts") String abstracts,
                           @RequestParam("description") String description) {
        MobilePhone mobilePhone = new MobilePhone();
        mobilePhone.setBrand(brand);
        mobilePhone.setModel(model);
        mobilePhone.setCapacity(capacity);
        mobilePhone.setColor(color);
        mobilePhone.setPrice(price);
        mobilePhone.setAbstracts(abstracts);
        mobilePhone.setDescription(description);
        System.out.println(photo);
        mobilePhone.setPhoto(photo);
        mobilePhoneService.updatePhone(mobilePhone);
        return "success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public void deletePhone(@PathVariable("id") int id) {
        mobilePhoneService.delete(id);
    }
}
