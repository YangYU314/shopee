package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.entity.Review;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import au.usyd.elec5619.service.Impl.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping(value = "/mobile_phone/**")
public class MobilePhoneController {

    @Autowired
    private MobilePhoneService mobilePhoneService;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping(value = "/find/{key}", method = RequestMethod.GET)
    public ModelAndView findMobilePhonesByKey(@PathVariable("key") String key) {
        List<MobilePhone> mobilePhones;
        mobilePhones = mobilePhoneService.getMobilePhoneByKeys(key);
        System.out.println(mobilePhones.size());
//        Map<String, Object> myModel = new HashMap<String, Object>();
//        myModel.put("mobilePhones", mobilePhones);
//        return new ModelAndView("refresh", "resources", myModel);
        return null;
    }

    @RequestMapping(value = "/apple/{model}")
    public ModelAndView getAllPhones(@PathVariable("model") String model) {
        List<MobilePhone> mobilePhones;
        mobilePhones = mobilePhoneService.getMobilesBySingleModel(model);
        List<String> colors = mobilePhoneService.getOnePropertyGroup("color");
        List<String> capacities = mobilePhoneService.getOnePropertyGroup("capacity");
        List<String> prices = mobilePhoneService.getOnePropertyGroup("price");
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobilePhones", mobilePhones);
        myModel.put("colors", colors);
        myModel.put("capacities", capacities);
        myModel.put("lowestPrice", prices.get(0));
        myModel.put("highestPrice", prices.get(prices.size() - 1));
        myModel.put("number", mobilePhones.size() - 1);
        myModel.put("model", model);
        myModel.put("brand", "apple");
        return new ModelAndView("show-mobilePhone", "resources", myModel);
    }

    @RequestMapping(value = "refreshAll", method = RequestMethod.POST)
    public ModelAndView mobileFilterAll(@RequestParam("model") String model, @RequestParam("colors[]") List<String> colors, @RequestParam("capacities[]") List<Integer> capacities, @RequestParam("prices[]") List<Integer> prices) {
        List<MobilePhone> mobilePhones = mobilePhoneService.mobilePhonesFilter(model, colors, capacities, prices);
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobilePhones", mobilePhones);
        myModel.put("number", mobilePhones.size() - 1);
        return new ModelAndView("refresh", "resources", myModel);
    }

    @RequestMapping(value = "/refreshColors", method = RequestMethod.POST)
    public ModelAndView mobileFilterColors(@RequestParam("model") String model, @RequestParam("colors[]") List<String> colors, @RequestParam("prices[]") List<Integer> prices) {
        List<MobilePhone> mobilePhones = mobilePhoneService.mobilePhonesFilter(model, colors, null, prices);
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobilePhones", mobilePhones);
        myModel.put("number", mobilePhones.size() - 1);
        return new ModelAndView("refresh", "resources", myModel);
    }

    @RequestMapping(value = "/refreshCapacities", method = RequestMethod.POST)
    public ModelAndView mobileFilterCapacities(@RequestParam("model") String model, @RequestParam("capacities[]") List<Integer> capacities, @RequestParam("prices[]") List<Integer> prices) {
        List<MobilePhone> mobilePhones = mobilePhoneService.mobilePhonesFilter(model, null, capacities, prices);
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobilePhones", mobilePhones);
        myModel.put("number", mobilePhones.size() - 1);
        return new ModelAndView("refresh", "resources", myModel);
    }

    @RequestMapping(value = "/refreshPrice", method = RequestMethod.POST)
    public ModelAndView mobileFilterPrice(@RequestParam("model") String model, @RequestParam("prices[]") List<Integer> prices) {
        List<MobilePhone> mobilePhones = mobilePhoneService.mobilePhonesFilter(model, null, null, prices);
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("mobilePhones", mobilePhones);
        myModel.put("number", mobilePhones.size() - 1);
        return new ModelAndView("refresh", "resources", myModel);
    }

    @RequestMapping(value = "/detailed/{id}")
    public ModelAndView detailedInfo(@PathVariable("id") int id) {
        Map<String, Object> myModel = new HashMap<String, Object>();
        MobilePhone mobilePhone = mobilePhoneService.getMobilePhoneById(id);
        String abstracts = mobilePhone.getAbstracts();
        String descriptions = mobilePhone.getDescription();
        String[] descriptionSplit = descriptions.split(";");
        Map<String, String> descriptionMap = new LinkedHashMap<>();
        for (String info : descriptionSplit) {
            String[] infoSplit = info.split(":");
            descriptionMap.put(infoSplit[0], infoSplit[1]);
        }
        List<Review> reviews = reviewService.getReviewsByMobile(id);
        double totalRate = 0;
        double rateNum = 0;
        double avgRate = 0;
        int[] allRates = {0, 0, 0, 0, 0};
        if (reviews.size() != 0) {
            for (Review review : reviews) {
                totalRate += review.getRate();
                rateNum++;
                switch (review.getRate()) {
                    case 5:
                        allRates[0]++;
                        break;
                    case 4:
                        allRates[1]++;
                        break;
                    case 3:
                        allRates[2]++;
                        break;
                    case 2:
                        allRates[3]++;
                        break;
                    case 1:
                        allRates[4]++;
                        break;
                }
            }
            BigDecimal bg = new BigDecimal(totalRate / rateNum);
            avgRate = bg.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
        }
        myModel.put("id", id);
        myModel.put("mobile", mobilePhone);
        myModel.put("abstracts", abstracts);
        myModel.put("descriptions", descriptionMap);
        myModel.put("reviews", reviews);
        myModel.put("avgRate", avgRate);
        myModel.put("rateNum", rateNum);
        myModel.put("allRates", allRates);
        return new ModelAndView("product_detail", "detailedInfo", myModel);
    }
}
