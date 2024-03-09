/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Group;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class GroupDBContextTest {
    
    public GroupDBContextTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getInstructorGroup method, of class GroupDBContext.
     */
    @Test
    public void testGetInstructorGroup() {
        System.out.println("getInstructorGroup");
        String iid = "";
        GroupDBContext instance = new GroupDBContext();
        ArrayList<Group> expResult = null;
        ArrayList<Group> result = instance.getInstructorGroup(iid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getStudentGroup method, of class GroupDBContext.
     */
    @Test
    public void testGetStudentGroup() {
        System.out.println("getStudentGroup");
        String stuid = "";
        GroupDBContext instance = new GroupDBContext();
        ArrayList<Group> expResult = null;
        ArrayList<Group> result = instance.getStudentGroup(stuid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of list method, of class GroupDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
        GroupDBContext instance = new GroupDBContext();
        ArrayList<Group> expResult = null;
        ArrayList<Group> result = instance.list();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insert method, of class GroupDBContext.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        Group entity = null;
        GroupDBContext instance = new GroupDBContext();
        instance.insert(entity);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class GroupDBContext.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        Group entity = null;
        GroupDBContext instance = new GroupDBContext();
        instance.update(entity);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class GroupDBContext.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        Group entity = null;
        GroupDBContext instance = new GroupDBContext();
        instance.delete(entity);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of get method, of class GroupDBContext.
     */
    @Test
    public void testGet() {
        System.out.println("get");
        Group entity = null;
        GroupDBContext instance = new GroupDBContext();
        Group expResult = null;
        Group result = instance.get(entity);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
