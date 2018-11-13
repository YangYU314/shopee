package test.au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.service.Impl.MobilePhoneService;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * MobilePhoneService Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Ê®ÔÂ 30, 2018</pre>
 */
public class MobilePhoneServiceTest {


    /**
     * Method: getMobilePhoneById(int id)
     */
    private MobilePhoneService mobilePhoneService;
    int testId = 1;

    @Test
    public void testGetMobilePhoneById() throws Exception {
//TODO: Test goes here...
        assertEquals(testId, mobilePhoneService.getMobilePhoneById(testId).getId());


    }


} 
