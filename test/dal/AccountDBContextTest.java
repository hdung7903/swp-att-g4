/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Account;
import entity.Instructor;
import entity.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author Administrator
 */
public class AccountDBContextTest {

    private Connection connection;

    @Before
    public void setUp() throws Exception {
        // Connect database
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/swp_ver2";
        String user = "admin";
        String password = "12345";

        connection = DriverManager.getConnection(url, user, password);
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

    @Test
    public void testValidateAccountInvalid() {
        System.out.println("ValidateAccountInvalid");
        String username = "admin";
        String password = "1234";
        AccountDBContext instance = new AccountDBContext();

        Account result = instance.ValidateAccount(username, password);
        assertNull(result);
    }

    /**
     * Test of ValidateAccountByEmail method, of class AccountDBContext.
     */
    @Test
    public void testValidateAccountByEmail() {
        System.out.println("ValidateAccountByEmail");
        String email = "quangpn808@gmail.com";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = new Account();
        expResult.setEmail(email);

        Account result = instance.ValidateAccountByEmail(email);
        assertNotNull(result);
        assertEquals(expResult.getEmail(), result.getEmail());
    }

    /**
     * Test of ValidateAccountByEmailAndUsername method, of class
     * AccountDBContext.
     */
    @Test
    public void testValidateAccountByEmailAndUsername() {
        System.out.println("ValidateAccountByEmailAndUsername");
        String username = "staff";
        String email = "quangpn808@gmail.com";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = new Account();
        expResult.setEmail(email);
        expResult.setUsername(username);

        Account result = instance.ValidateAccountByEmailAndUsername(username, email);
        assertEquals(expResult.getEmail(), result.getEmail());
        assertEquals(expResult.getUsername(), result.getUsername());
        assertNotNull(result);
    }

    /**
     * Test of resetPassword method, of class AccountDBContext.
     */
//    @Test
//    public void testResetPassword() {
//        System.out.println("resetPassword");
//        String email = "quangpn808@gmail.com";
//        String username = "staff";
//        String newPassword = "1234";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = true;
//        boolean result = instance.resetPassword(email, username, newPassword);
//        assertEquals(expResult, result);
//    }
    /**
     * Test of getAccountIdByUsername method, of class AccountDBContext.
     */
//    @Test
//    public void testGetAccountIdByUsername() {
//        System.out.println("getAccountIdByUsername");
//        String username = "QuangPN"; // Provide a valid username here
//        AccountDBContext instance = new AccountDBContext();
//        Account expResult = new Account(); // Create an expected Account object with the expected properties
//
//        // Set the expected properties based on your test scenario
//        Instructor ins = new Instructor();
//        ins.setId("5");
//        ins.setEmail("QuangPN@gmail.com");
//        expResult.setInstructor(ins);
//
//        // Set other properties if needed, such as instructor
//        Account result = instance.getAccountIdByUsername(username);
//        assertEquals(expResult.getInstructor().getId(), result.getInstructor().getId());
//        assertEquals(expResult.getInstructor().getEmail(), result.getInstructor().getEmail());
//    }

    /**
     * Test of getIntructorByUserName method, of class AccountDBContext.
     */
    @Test
    public void testGetIntructorByUserName() {
        System.out.println("getIntructorByUserName");
        String username = "HoaiBM";
        AccountDBContext instance = new AccountDBContext();
        Instructor expResult = new Instructor();
        expResult.setId("3");
        expResult.setEmail("hoaibm@example.com");
        expResult.setName("Bùi Minh Hoài");

        Instructor result = instance.getIntructorByUserName(username);

        assertEquals(expResult.getId(), result.getId());
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getEmail(), result.getEmail());
    }
    
    @Test
    public void testGetIntructorByUserName1() {
        System.out.println("getIntructorByUserName");
        String username = "QuangPN";
        AccountDBContext instance = new AccountDBContext();

        Instructor result = instance.getIntructorByUserName(username);
        assertNull(result);
    }
    
    @Test
    public void testGetIntructorByUserName2() {
        System.out.println("getIntructorByUserName");
        String username = "";
        AccountDBContext instance = new AccountDBContext();
        Instructor expResult = new Instructor();
        expResult.setId("3");
        expResult.setEmail("hoaibm@example.com");
        expResult.setName("Bùi Minh Hoài");

        Instructor result = instance.getIntructorByUserName(username);

        assertNull(result);
    }
    
    @Test
    public void testGetIntructorByUserName3() {
        System.out.println("getIntructorByUserName");
        String username = null;
        AccountDBContext instance = new AccountDBContext();
        Instructor expResult = new Instructor();
        expResult.setId("3");
        expResult.setEmail("hoaibm@example.com");
        expResult.setName("Bùi Minh Hoài");

        Instructor result = instance.getIntructorByUserName(username);

        assertNull(result);
    }

    /**
     * Test of getStudentByUserName method, of class AccountDBContext.
     */
    @Test
    public void testGetStudentByUserName() {
        System.out.println("getStudentByUserName");
        String username = "student1";
        AccountDBContext instance = new AccountDBContext();
        Student expResult = new Student();
        expResult.setId("1");
        expResult.setEmail("tranvana@example.com");
        expResult.setName("Trần Văn A");

        Student result = instance.getStudentByUserName(username);

        // Verify if the returned Instructor object matches the expected result
        assertEquals(expResult.getId(), result.getId());
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getEmail(), result.getEmail());
    }

    /**
     * Test of changePassword method, of class AccountDBContext.
     */
//    @Test
//    public void testChangePassword() {
//        System.out.println("changePassword");
//        String username = "student11";
//        String newPassword = "1234";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = true;
//        boolean result = instance.changePassword(username, newPassword);
//        assertEquals(expResult, result);
//    }
    /**
     * Test of getAllStudent method, of class AccountDBContext.
     */
    @Test
    public void testGetAllStudent() {
        System.out.println("getAllStudent");
        String txtSearch = "r"; // Set the search text here
        boolean isDeletedRule = false;
        AccountDBContext instance = new AccountDBContext();

        int expResult = 12;

        Vector<Student> result = instance.getAllStudent(txtSearch, isDeletedRule);
        int actual = result.size();
        // Compare the size of the expected result and the actual result
        assertEquals(expResult, actual);
    }

    /**
     * Test of getAllInstructor method, of class AccountDBContext.
     */
    @Test
    public void testGetAllInstructor() {
        System.out.println("getAllStudent");
        String txtSearch = "Quang"; // Set the search text here
        boolean isDeletedRule = false;
        AccountDBContext instance = new AccountDBContext();

        int expResult = 0;

        Vector<Instructor> result = instance.getAllInstructor(txtSearch, isDeletedRule);
        int actual = result.size();
        // Compare the size of the expected result and the actual result
        assertEquals(expResult, actual);
    }

    /**
     * Test of getAllManage method, of class AccountDBContext.
     */
    @Test
    public void testGetAllManage() {
        System.out.println("getAllManage");
        String txtSearch = "";
        int role = 0;
        boolean isDeletedRule = false;
        AccountDBContext instance = new AccountDBContext();

        Vector<Account> expResult = new Vector<>();
        expResult.add(new Account(1, "staff", "quangpn808@gmail.com"));
        expResult.add(new Account(2, "admin", "admin@example.com"));

        Vector<Account> result = instance.getAllManage(txtSearch, role, isDeletedRule);

        assertEquals(expResult.size(), result.size());

        for (int i = 0; i < expResult.size(); i++) {
            Account expAccount = expResult.get(i);
            Account account = result.get(i);
            assertEquals(expAccount.getRole_id(), account.getRole_id());
            assertEquals(expAccount.getUsername(), account.getUsername());
            assertEquals(expAccount.getEmail(), account.getEmail());
        }
    }

    /**
     * Test of insertAccount method, of class AccountDBContext.
     */
//    @Test
//   public void testInsertAccount() {
//        System.out.println("insertAccount");
//        String id = "444"; 
//        String username = "LongLV"; 
//        String password = "Ph20090223@"; 
//        int role_id = 4; 
//        String fullName = "Lê Việt Long"; 
//        String email = "LongLV@gmail.com"; 
//        String dob = "2002-3-31";
//        int gender = 1;
//       AccountDBContext instance = new AccountDBContext();
//
//        boolean expResult = true; 
//
//       boolean result = instance.insertAccount(id, username, password, role_id, fullName, email, dob, gender);
//        assertEquals(expResult, result);
//    }
    /**
     * Test of deleteAccount method, of class AccountDBContext.
     */
//    @Test
//    public void testDeleteAccount() {
//        System.out.println("deleteAccount");
//        String username = ""; // Set the username value here
//        AccountDBContext instance = new AccountDBContext();
//
//        boolean expResult = false; // Set the expected result based on your test scenario
//
//        boolean result = instance.deleteAccount(username);
//        assertEquals(expResult, result);
//    }
//    @Test
//    public void testDeleteRuleAccount() {
//        System.out.println("deleteRuleAccount");
//        String username = "student40"; // Set the username value here
//        AccountDBContext instance = new AccountDBContext();
//
//        boolean expResult = true; // Set the expected result based on your test scenario
//
//        boolean result = instance.deleteRuleAccount(username);
//        assertEquals(expResult, result);
//    }
    /**
     * Test of getAcountByUsername method, of class AccountDBContext.
     */
    @Test
    public void testGetAcountByUsername() {
        System.out.println("getAcountByUsername");
        String username = "admin"; // Set the username value here
        AccountDBContext instance = new AccountDBContext();
        Account expResult = new Account();

        expResult.setUsername(username);
        expResult.setPassword("123");

        Account result = instance.getAcountByUsername(username);
        assertEquals(expResult.getUsername(), result.getUsername());
        assertEquals(expResult.getPassword(), result.getPassword());
    }

    /**
     * Test of restoreAccount method, of class AccountDBContext.
     */
//    @Test
//    public void testRestoreAccount() {
//        System.out.println("restoreAccount");
//        String username = "student40"; // Set the username value here
//        AccountDBContext instance = new AccountDBContext();
//
//        boolean expResult = true; // Set the expected result based on your test scenario
//
//        boolean result = instance.restoreAccount(username);
//        assertEquals(expResult, result);
//    }

    /**
     * Test of getResultSet method, of class AccountDBContext.
     */
//    @Test
//    public void testGetResultSet() {
//        System.out.println("getResultSet");
//        AccountDBContext instance = new AccountDBContext();
//
//        int expResult = 53;
//
//        Vector<Account> result = instance.getResultSet();
//        int actual = result.size();
//        assertEquals(expResult, actual);
//    }

    /**
     * Test of updateStudent method, of class AccountDBContext.
     */
//    @Test
//    public void testUpdateStudent() {
//        System.out.println("updateStudent");
//
//        // Create a sample Student object
//        Student student = new Student();
//        student.setName("Trần Văn A");
//        student.setEmail("tranvana@example.com");
//        student.setDob(java.sql.Date.valueOf("2002-8-20"));
//        student.setUsername("student1");
//
//        AccountDBContext instance = new AccountDBContext();
//
//        instance.updateStudent(student);
//
//        Student updatedStudent = instance.getStudentByUserName(student.getUsername());
//
//        assertEquals(student.getUsername(), updatedStudent.getUsername());
//        assertEquals(student.getName(), updatedStudent.getName());
//        assertEquals(student.getEmail(), updatedStudent.getEmail());
//    }

//    /**
//     * Test of updateInstructor method, of class AccountDBContext.
//     */
//    @Test
//    public void testUpdateInstructor() {
//        System.out.println("updateInstructor");
//        Instructor instructor = new Instructor();
//        instructor.setName("Nguyễn Hoàn");
//        instructor.setEmail("HoanNN@gmail.com");
//        instructor.setDob(java.sql.Date.valueOf("1994-10-20"));
//        instructor.setUsername("HoanNN");
//                
//        AccountDBContext instance = new AccountDBContext();
//         instance.updateInstructor(instructor);
//         Instructor updatedInstructor = instance.getIntructorByUserName(instructor.getUsername());
//
//        assertEquals(instructor.getUsername(), updatedInstructor.getUsername());
//        assertEquals(instructor.getEmail(), updatedInstructor.getEmail());
//    }
}
