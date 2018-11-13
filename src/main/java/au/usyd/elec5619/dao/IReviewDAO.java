package au.usyd.elec5619.dao;

import au.usyd.elec5619.entity.Review;

import java.util.List;

public interface IReviewDAO {
    List<Review> getReviewsByMobile(int mobileId);
}
