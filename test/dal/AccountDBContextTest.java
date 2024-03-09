/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Account;
import entity.Instructor;
import entity.Student;
import java.util.ArrayList;
import java.util.Vector;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class AccountDBContextTest {
    
    public AccountDBContextTest() {
    }

    /**
     * Test of ValidateAccount method, of class AccountDBContext.
     */
    @Test
    public void testValidateAccount() {
        System.out.println("ValidateAccount");
        String username = "admin";
        String password = "1234";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.ValidateAccount(username, password);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of ValidateAccountByEmail method, of class AccountDBContext.
     */
    @Test
    public void testValidateAccountByEmail() {
        System.out.println("ValidateAccountByEmail");
        String email = "quangpn808@gmail.com";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.ValidateAccountByEmail(email);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }
//
//    /**
//     * Test of ValidateAccountByEmailAndUsername method, of class AccountDBContext.
//     */
//    @Test
//    public void testValidateAccountByEmailAndUsername() {
//        System.out.println("ValidateAccountByEmailAndUsername");
//        String userName = "";
//        String email = "";
//        AccountDBContext instance = new AccountDBContext();
//        Account expResult = null;
//        Account result = instance.ValidateAccountByEmailAndUsername(userName, email);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of resetPassword method, of class AccountDBContext.
//     */
//    @Test
//    public void testResetPassword() {
//        System.out.println("resetPassword");
//        String email = "";
//        String username = "";
//        String newPassword = "";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.resetPassword(email, username, newPassword);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAccountIdByUsername method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetAccountIdByUsername() {
//        System.out.println("getAccountIdByUsername");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        Account expResult = null;
//        Account result = instance.getAccountIdByUsername(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getIntructorByUserName method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetIntructorByUserName() {
//        System.out.println("getIntructorByUserName");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        Instructor expResult = null;
//        Instructor result = instance.getIntructorByUserName(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getStudentByUserName method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetStudentByUserName() {
//        System.out.println("getStudentByUserName");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        Student expResult = null;
//        Student result = instance.getStudentByUserName(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of changePassword method, of class AccountDBContext.
//     */
//    @Test
//    public void testChangePassword() {
//        System.out.println("changePassword");
//        String username = "";
//        String newPassword = "";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.changePassword(username, newPassword);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAllStudent method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetAllStudent() {
//        System.out.println("getAllStudent");
//        String txtSearch = "";
//        boolean isDeletedRule = false;
//        AccountDBContext instance = new AccountDBContext();
//        Vector<Student> expResult = null;
//        Vector<Student> result = instance.getAllStudent(txtSearch, isDeletedRule);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAllInstructor method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetAllInstructor() {
//        System.out.println("getAllInstructor");
//        String txtSearch = "";
//        boolean isDeletedRule = false;
//        AccountDBContext instance = new AccountDBContext();
//        Vector<Instructor> expResult = null;
//        Vector<Instructor> result = instance.getAllInstructor(txtSearch, isDeletedRule);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAllManage method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetAllManage() {
//        System.out.println("getAllManage");
//        String txtSearch = "";
//        int role = 0;
//        boolean isDeletedRule = false;
//        AccountDBContext instance = new AccountDBContext();
//        Vector<Account> expResult = null;
//        Vector<Account> result = instance.getAllManage(txtSearch, role, isDeletedRule);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of insertAccount method, of class AccountDBContext.
//     */
//    @Test
//    public void testInsertAccount() {
//        System.out.println("insertAccount");
//        String id = "";
//        String username = "";
//        String password = "";
//        int role_id = 0;
//        String fullName = "";
//        String email = "";
//        String dob = "";
//        int gender = 0;
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.insertAccount(id, username, password, role_id, fullName, email, dob, gender);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of deleteAccount method, of class AccountDBContext.
//     */
//    @Test
//    public void testDeleteAccount() {
//        System.out.println("deleteAccount");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.deleteAccount(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of deleteRuleAccount method, of class AccountDBContext.
//     */
//    @Test
//    public void testDeleteRuleAccount() {
//        System.out.println("deleteRuleAccount");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.deleteRuleAccount(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAcountByUsername method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetAcountByUsername() {
//        System.out.println("getAcountByUsername");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        Account expResult = null;
//        Account result = instance.getAcountByUsername(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of restoreAccount method, of class AccountDBContext.
//     */
//    @Test
//    public void testRestoreAccount() {
//        System.out.println("restoreAccount");
//        String username = "";
//        AccountDBContext instance = new AccountDBContext();
//        boolean expResult = false;
//        boolean result = instance.restoreAccount(username);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getResultSet method, of class AccountDBContext.
//     */
//    @Test
//    public void testGetResultSet() {
//        System.out.println("getResultSet");
//        AccountDBContext instance = new AccountDBContext();
//        Vector<Account> expResult = null;
//        Vector<Account> result = instance.getResultSet();
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of list method, of class AccountDBContext.
//     */
//    @Test
//    public void testList() {
//        System.out.println("list");
//        AccountDBContext instance = new AccountDBContext();
//        ArrayList<Account> expResult = null;
//        ArrayList<Account> result = instance.list();
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of insert method, of class AccountDBContext.
//     */
//    @Test
//    public void testInsert() {
//        System.out.println("insert");
//        Account entity = null;
//        AccountDBContext instance = new AccountDBContext();
//        instance.insert(entity);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of update method, of class AccountDBContext.
//     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        Account entity = null;
//        AccountDBContext instance = new AccountDBContext();
//        instance.update(entity);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of delete method, of class AccountDBContext.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        Account entity = null;
//        AccountDBContext instance = new AccountDBContext();
//        instance.delete(entity);
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of get method, of class AccountDBContext.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        Account entity = null;
//        AccountDBContext instance = new AccountDBContext();
//        Account expResult = null;
//        Account result = instance.get(entity);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
    
}
