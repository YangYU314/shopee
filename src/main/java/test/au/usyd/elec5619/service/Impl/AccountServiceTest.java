package test.au.usyd.elec5619.service.Impl;

import au.usyd.elec5619.service.Impl.AccountService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * AccountService Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Ê®ÔÂ 30, 2018</pre>
 */
public class AccountServiceTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    private AccountService accountService;
    private String usrname = "cl";
    private String pwd = "cl";

    protected void setUp() throws Exception {

        accountService = new AccountService();
        String test_new_email = "new@gmail.com";

    }

    /**
     * Method: login(String username, String password)
     */
    @Test
    public void testLogin() throws Exception {
//TODO: Test goes here...
        assertEquals(usrname, accountService.login(usrname, pwd).getUsername());
    }

    /**
     * Method: isUsernameExist(String username)
     */
    @Test
    public void testIsUsernameExist() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: addBuyer(String username, String password, String email)
     */
    @Test
    public void testAddBuyer() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: updateUser(int id, String username, String password, String email)
     */
    @Test
    public void testUpdateUser() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getEmail(String username)
     */
    @Test
    public void testGetEmail() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getUserById(int id)
     */
    @Test
    public void testGetUserById() throws Exception {
//TODO: Test goes here... 
    }


} 
