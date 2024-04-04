/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
//import java.lang.Runtime.exit;
/**
 *
 * @author Admin
 */
public class AccountDBContextTest {
    
    public AccountDBContextTest() {
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
    
}
