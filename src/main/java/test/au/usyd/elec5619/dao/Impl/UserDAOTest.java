package test.au.usyd.elec5619.dao.Impl;

import au.usyd.elec5619.dao.Impl.UserDAO;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:/spring/appServlet/servlet-context.xml"})    // ��ȡspring�����ļ�
//@ContextConfiguration({
//
//        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
//
//        "classpath*: springxml/**.xml”
//
//})


/**
 * UserDAO Tester.
 /
 * @author <Authors name>
 * @since <pre>ʮ�� 30, 2018</pre>
 * @version 1.0
 */
public class UserDAOTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getUser(String username, String password)
     */
    @Autowired    //����applicationContext.xml���Զ�ע��ָ����bean
            UserDAO userDAO;

    @Test
    public void testGetUser() throws Exception {
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
     * Method: addBuyer(User newBuyer)
     */
    @Test
    public void testAddBuyer() throws Exception {
//TODO: Test goes here...

    }

    /**
     * Method: updateUser(User user, int id)
     */
    @Test
    public void testUpdateUser() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getUserByUsername(String username)
     */
    @Test
    public void testGetUserByUsername() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getUserById(int Id)
     */
    @Test
    public void testGetUserById() throws Exception {
//TODO: Test goes here... 
    }


} 
