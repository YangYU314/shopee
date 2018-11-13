package au.usyd.elec5619.controller;

import au.usyd.elec5619.entity.MobilePhone;
import au.usyd.elec5619.service.Impl.MobilePhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class UploadController {
    @RequestMapping("/fileUpload")
    @ResponseBody
    public String fileUpload(MultipartFile image, HttpServletRequest request) throws IOException {
        if (image != null) {
            String originalFilename = image.getOriginalFilename();
//            String dirPath = "/Users/wyf/IdeaProjects/Shopee/src/main/webapp/images/";
            String dirPath = request.getSession().getServletContext().getRealPath("/") + "images/";
            System.out.println(dirPath);
            File file = new File(dirPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            String newFilename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            image.transferTo(new File(dirPath + newFilename));
            System.out.println(newFilename);
            return newFilename;
        }
        return null;
    }
}
