/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Application;
import entity.Student;
import entity.TypeApplication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Assert;
import org.junit.Before;

/**
 *
 * @author Administrator
 */
public class ApplicationDBContextTest {
    
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
    
    public ApplicationDBContextTest() {
    }

    /**
     * Test of insert method, of class ApplicationDBContext.
     */
//    @Test
//    public void testInsert() {
//        System.out.println("insert");
//
//        Application application = new Application();
//        application.setStudent(new Student("2")); 
//        application.setCreate_date(java.sql.Date.valueOf("2022-01-01"));
//        application.setContent("Test Application");
//        application.setType(new TypeApplication(1)); 
//
//        ApplicationDBContext instance = new ApplicationDBContext();
//
//        instance.insert(application);
//        
//        Application insertedApplication = instance.get(49);
//
//        assertEquals(application.getStudent().getId(), insertedApplication.getStudent().getId());
//        assertEquals(application.getCreate_date(), insertedApplication.getCreate_date());
//        assertEquals(application.getContent(), insertedApplication.getContent());
//    }

    /**
     * Test of list method, of class ApplicationDBContext.
     */
     @Test
    public void testList() {
        System.out.println("list");

        ApplicationDBContext instance = new ApplicationDBContext();
        int sizeExp = 45;
        
        ArrayList<Application> result = instance.list();
        int sizeResult = result.size();

         Assert.assertNotNull(result);

        assertFalse(result.isEmpty());

        assertEquals(sizeExp, sizeResult);
    }

    /**
     * Test of get method, of class ApplicationDBContext.
     */
     @Test
    public void testGet_int() {
        System.out.println("get");

        int id = 1; 
        Application app = new Application();
        Student stu = new Student();
        stu.setName("Trần Văn A");
        app.setStudent(stu);
        app.setContent("ahihi");
        
        ApplicationDBContext instance = new ApplicationDBContext();

        Application result = instance.get(id);

         Assert.assertNotNull(result);

         Assert.assertEquals(id, result.getId());

         Assert.assertNotNull(result.getStudent());

         Assert.assertNotNull(result.getContent());

         Assert.assertNotNull(result.getCreate_date());

         assertEquals(app.getStudent().getName(), result.getStudent().getName());
         assertEquals(app.getContent(), result.getContent());
    }

    /**
     * Test of getAppByStudent method, of class ApplicationDBContext.
     */
     @Test
    public void testGetAppByStudent() {
        System.out.println("getAppByStudent");

        String student_id = "1"; 

        ApplicationDBContext instance = new ApplicationDBContext();
        Application app = new Application();
        Student stu = new Student();
        stu.setName("Trần Văn A");
        app.setStudent(stu);
        app.setContent("ahihi");

        ArrayList<Application> result = instance.getAppByStudent(student_id);

        assertNotNull(result);
        assertFalse(result.isEmpty());
         
        assertEquals(app.getStudent().getName(), result.get(0).getStudent().getName());
        assertEquals(app.getContent(), result.get(0).getContent());
    }
    
         @Test
    public void testGetAppByStudent3() {
        System.out.println("getAppByStudent");

        String student_id = ""; 

        ApplicationDBContext instance = new ApplicationDBContext();
        Application app = new Application();
        Student stu = new Student();
        stu.setName("Trần Văn A");
        app.setStudent(stu);
        app.setContent("ahihi");

        ArrayList<Application> result = instance.getAppByStudent(student_id);

        assertTrue(result.isEmpty());
    }
    
         @Test
    public void testGetAppByStudent1() {
        System.out.println("getAppByStudent");

        String student_id = "70"; 

        ApplicationDBContext instance = new ApplicationDBContext();
        Application app = new Application();
        Student stu = new Student();
        stu.setName("Nguyễn Văn A");
        app.setStudent(stu);
        app.setContent("ahihi");

        ArrayList<Application> result = instance.getAppByStudent(student_id);

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }
    
         @Test
    public void testGetAppByStudent2() {
        System.out.println("getAppByStudent");

        String student_id = null; 

        ApplicationDBContext instance = new ApplicationDBContext();
        Application app = new Application();
        Student stu = new Student();
        stu.setName("Nguyễn Văn A");
        app.setStudent(stu);
        app.setContent("ahihi");

        ArrayList<Application> result = instance.getAppByStudent(student_id);

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    /**
     * Test of updateIsSend method, of class ApplicationDBContext.
     */
    @Test
    public void testUpdateIsSend() {
        System.out.println("updateIsSend");

        int appId = 1; 

        ApplicationDBContext instance = new ApplicationDBContext();

        instance.updateIsSend(appId);

        Application updatedApplication = instance.get(appId);
        assertEquals(true, updatedApplication.getIsSend());
    }

    /**
     * Test of updateIsApprove method, of class ApplicationDBContext.
     */
    @Test
    public void testUpdateIsApprove() {
        System.out.println("updateIsApprove");

        int appId = 1; 
        boolean isApprove = true; 
        String comment = "Approved"; 
        boolean isSend = true; 

        ApplicationDBContext instance = new ApplicationDBContext();

        instance.updateIsApprove(appId, isApprove, comment, isSend);

        Application updatedApplication = instance.get(appId);
        Assert.assertEquals(isApprove, updatedApplication.getIsApprove());
        Assert.assertEquals(comment, updatedApplication.getComment());
        Assert.assertEquals(isSend, updatedApplication.getIsSend());

        // Optionally, you can validate other properties of the updated application
        /*
        Assert.assertEquals(expectedValue, updatedApplication.getSomeProperty());
        Assert.assertEquals(expectedValue, updatedApplication.getSomeOtherProperty());
        // ...
        */
    }

//    /**
//     * Test of main method, of class ApplicationDBContext.
//     */
//    @Test
//    public void testMain() {
//        System.out.println("main");
//        String[] args = null;
//        ApplicationDBContext.main(args);
//        fail("The test case is a prototype.");
//    }
    
}
