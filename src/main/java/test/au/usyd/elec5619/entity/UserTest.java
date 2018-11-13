package test.au.usyd.elec5619.entity;

import au.usyd.elec5619.entity.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNull;

/**
 * User Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>ʮ�� 30, 2018</pre>
 */
public class UserTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getType()
     */
    @Test
    public void testGetType() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: setType(String type)
     */
    @Test
    public void testSetandGetType() throws Exception {
//TODO: Test goes here...
        User user = new User();
        String testtype = "B";
        assertNull(user.getType());
        user.setType(testtype);
        assertEquals(testtype, user.getType());

    }

    /**
     * Method: getId()
     */
    @Test
    public void testGetId() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: setId(int id)
     */
    @Test
    public void testSetAndGetId() throws Exception {
//TODO: Test goes here...
        User user = new User();
        int testid = 100;
        assertEquals(0, user.getId());
        user.setId(testid);
        assertEquals(testid, user.getId());
    }

    /**
     * Method: getUsername()
     */
    @Test
    public void testGetUsername() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: setUsername(String username)
     */
    @Test
    public void testSetandGetUsername() throws Exception {
//TODO: Test goes here...
        User user = new User();
        String testusername = "fff";
        assertNull(user.getUsername());
        user.setUsername(testusername);
        assertEquals(testusername, user.getUsername());
    }

    /**
     * Method: getPassword()
     */
    @Test
    public void testGetPassword() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: setPassword(String password)
     */
    @Test
    public void testSetandGetPassword() throws Exception {
//TODO: Test goes here... \
        User user = new User();
        String testpwd = "B";
        assertNull(user.getPassword());
        user.setPassword(testpwd);
        assertEquals(testpwd, user.getPassword());
    }

    /**
     * Method: getEmail()
     */
    @Test
    public void testSetandGetEmail() throws Exception {
//TODO: Test goes here...
        User user = new User();
        String testemail = "qq@qq.com";
        assertNull(user.getEmail());
        user.setEmail(testemail);
        assertEquals(testemail, user.getEmail());
    }

    /**
     * Method: setEmail(String email)
     */
    @Test
    public void testTostring() throws Exception {
//TODO: Test goes here...
        User user = new User();
        int testid = 0;
        String testusername = "cl";
        String testpwd = "cl";
        String testemail = "cl@qq.com";
        String testtype = "B";
        user.setId(testid);
        user.setUsername(testusername);
        user.setType(testtype);
        user.setPassword(testpwd);
        user.setEmail(testemail);
        assertEquals("ID: 0 ; Username: clPassword: clPhone: cl@qq.comTypeB", user.toString());
    }

/**
 *
 * Method: toString()
 *
 */


} 
