package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.Review;

import java.util.List;

public interface IReviewService {
    List<Review> getReviewsByMobile(int Pid);
}
