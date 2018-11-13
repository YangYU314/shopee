package au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.dao.Impl.ReviewDAO;
import au.usyd.elec5619.dao.Impl.UserDAO;
import au.usyd.elec5619.entity.Review;
import au.usyd.elec5619.entity.User;
import au.usyd.elec5619.service.IAccountService;
import au.usyd.elec5619.service.IReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "reviewService")
public class ReviewService implements IReviewService {

    @Autowired
    private ReviewDAO reviewDAO;

    @Override
    public List<Review> getReviewsByMobile(int Pid) {
        return reviewDAO.getReviewsByMobile(Pid);
    }
}
