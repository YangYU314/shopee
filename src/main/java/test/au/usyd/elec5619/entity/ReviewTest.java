package test.au.usyd.elec5619.entity;

import au.usyd.elec5619.entity.Review;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * Review Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Ê®ÔÂ 30, 2018</pre>
 */
public class ReviewTest {


    /**
     * Method: setId() getTitle()
     */
    @Test
    public void testSetandGetTitle() throws Exception {
        //TODO: Test goes here...
        String reviewTitle = "no good";
        Review review = new Review();
        assertNull(review.getTitle());
        review.setTitle(reviewTitle);
        assertEquals(reviewTitle, review.getTitle());
    }
}
