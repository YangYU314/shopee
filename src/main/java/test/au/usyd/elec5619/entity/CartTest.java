package test.au.usyd.elec5619.entity;

import au.usyd.elec5619.entity.Cart;
import au.usyd.elec5619.entity.Product;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

/**
 * Product Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>ʮ�� 29, 2018</pre>
 */
public class CartTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getDescription()
     */
    @Test
    public void testSetandGetDescription() throws Exception {
//TODO: Test goes here...
        Cart cart = new Cart();
        int qty = 2;
        assertEquals(0, cart.getQty());
        cart.setQty(qty);
        assertEquals(qty, cart.getQty());
    }

    /**
     * Method: setDescription(String description)
     */
    @Test
    public void testSetDescription() throws Exception {
//TODO: Test goes here...
        Product product = new Product();
        String testDescription = "the shy";
    }

    /**
     * Method: getPrice()
     */
    @Test
    public void testGetPrice() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: setPrice(Double price)
     */
    @Test
    public void testSetandGetPrice() throws Exception {
//TODO: Test goes here...
        Product product = new Product();
        double testPrice = 1000;
        assertNull(product.getPrice());
        product.setPrice(testPrice);
        assertEquals(testPrice, product.getPrice());
    }

    /**
     * Method: getId()
     */
    @Test
    public void testSetandGetId() throws Exception {
//TODO: Test goes here...
        Product product = new Product();
        long testId = 1;
        assertEquals(0, product.getId());
        product.setId(testId);
        assertEquals(testId, product.getId());
    }

    /**
     * Method: setId(long id)
     */
    @Test
    public void testSetId() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: toString()
     */
    @Test
    public void testToString() throws Exception {
//TODO: Test goes here...
        Product product = new Product();
        long testId = 998;
        String testDescription = "wtf";
        double testPrice = 17181;
        product.setId(testId);
        product.setDescription(testDescription);
        product.setPrice(testPrice);
        String result = "Description: " + testDescription + " ;" + " Price: " + testPrice;
        assertEquals(result, product.toString());
    }
} 
