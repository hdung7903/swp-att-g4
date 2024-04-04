/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package dal;

import entity.Account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author Admin
 */
public class GSMDBContextTest {

    GSMDBContextTest GSMDBContextTest;

    public GSMDBContextTest() {
    }

    protected Connection connection; 
    
    @Before
    public void setUp() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/swp_ver2";
            String user = "root";
            String password = "paimon306@";

            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connection OK!");
    }

    @After
    public void tearDown() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
    
    @Test
    public void testValidateAccount() {
        System.out.println("ValidateAccount");
        String username = "admin";
        String password = "123";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = new Account();
        expResult.setUsername(username);
        expResult.setPassword(password);
        Account result = instance.ValidateAccount(username, password);
        assertEquals(expResult.getUsername(), result.getUsername());
        assertEquals(expResult.getPassword(), result.getPassword());
    }
    
    
    

//    /**
//     * Test of getGroupbyInstructor method, of class GSMDBContext.
//     */
//    @Test
//    public void testGetGroupbyInstructor() {
//        System.out.println("getGroupbyInstructor");
//        String instructor_id = "3";
//        GSMDBContext instance = new GSMDBContext();
//        ArrayList<GroupSubjectMapping> expResult = new ArrayList<>();
//        expResult.add("3", "Bùi Minh Hoài", 3, "SWR302", 1, "SE1753");
//        expResult.add("3", "Bùi Minh Hoài", 7, "SWR302", 2, "SE1760");
//        expResult.add("3", "Bùi Minh Hoài", 11, "SWR302", 3, "SE1761");
//        expResult.add("3", "Bùi Minh Hoài", 15, "SWR302", 4, "SE1762");
//
//        ArrayList<GroupSubjectMapping> result = instance.getGroupbyInstructor(instructor_id);
//        assertEquals(expResult, result);
//    }
}
