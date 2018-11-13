package test.au.usyd.elec5619.entity;

import au.usyd.elec5619.entity.MobilePhone;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * MobilePhone Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Ê®ÔÂ 30, 2018</pre>
 */
public class MobilePhoneTest {

    /**
     * Method: setId() getId()
     */
    @Test
    public void testSetandGetId() throws Exception {
        //TODO: Test goes here...
        int testId = 22;
        MobilePhone mobilePhone = new MobilePhone();
        mobilePhone.setId(testId);
        assertEquals(testId, mobilePhone.getId());
    }
} 
