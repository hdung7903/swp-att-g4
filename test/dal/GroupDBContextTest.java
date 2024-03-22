/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Group;
import entity.GroupSubjectMapping;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class GroupDBContextTest {

    public GroupDBContextTest() {
    }

    /**
     * Test of createClass method, of class GroupDBContext.
     */
//     @Test
//    public void testCreateClass() {
//        System.out.println("createClass");
//        
//        String name = "SE1763";
//        String link_url = "MeetTest";
//        
//        GroupDBContext instance = new GroupDBContext();
//        
//        instance.createClass(name, link_url);
//        
//       Group result = instance.getClassNewset();
//       assertEquals(name, result.getName());
//       assertEquals(link_url, result.getLink_url());
//    }
    /**
     * Test of getClassById method, of class GroupDBContext.
     */
    @Test
    public void testGetClassById() {
        System.out.println("getClassById");

        // Giả sử class_id cần tìm là "123"
        String class_id = "1";
        String name = "SE1753";
        String link_url = "meet.google.com/xcs-aron-wyz";

        GroupDBContext instance = new GroupDBContext();

        Group result = instance.getClassById(class_id);

        assertNotNull(result);
        assertEquals(class_id, result.getId());
        assertEquals(name, result.getName());
        assertEquals(link_url, result.getLink_url());
    }

    /**
     * Test of insertClass method, of class GroupDBContext.
     */
//    @Test
//    public void testInsertClass() {
//        System.out.println("insertClass");
//
//        String class_id = "28";
//        String subject_id = "3";
//        String instructor_id = "3";
//        String slot = "25";
//
//        GroupDBContext instance = new GroupDBContext();
//        GSMDBContext gsmDB = new GSMDBContext();
//        
//        instance.insertClass(class_id, subject_id, slot, instructor_id);
//
//        GroupSubjectMapping insertedGSM = gsmDB.getClassNewset();
//
//        assertEquals(class_id, insertedGSM.getGroup().getId());
//        assertEquals(subject_id, insertedGSM.getSubject().getId());
//         assertEquals(instructor_id, insertedGSM.getInstructor().getId());
//        assertEquals(slot, String.valueOf(insertedGSM.getTotal_slots()));
//    }
//
    /**
     * Test of getClassNewset method, of class GroupDBContext.
     */
    @Test
    public void testGetClassNewset() {
        System.out.println("getClassNewset");
        GroupDBContext instance = new GroupDBContext();
        String id="32";
        String name="SE1752";
        String link="12345";

        Group result = instance.getClassNewset();

        assertNotNull(result);

        assertEquals(id, result.getId());
        assertEquals(name, result.getName());
        assertEquals(link, result.getLink_url());
    }

    /**
     * Test of getAllClass method, of class GroupDBContext.
     */
    @Test
    public void testGetAllClass() throws Exception {
        System.out.println("getAllClass");
        GroupDBContext instance = new GroupDBContext();
        Group gr = new Group();
        gr.setName("SE1753");
        gr.setLink_url("meet.google.com/xcs-aron-wyz");
        
        List<Group> result = instance.getAllClass();
        int size = 32;
        
        
        assertEquals(size, result.size());
        assertEquals(gr.getName(), result.get(0).getName());
        assertEquals(gr.getLink_url(), result.get(0).getLink_url());
    }

    /**
     * Test of checkClassExist method, of class GroupDBContext.
     */
    @Test
    public void testCheckClassExist() {
        System.out.println("checkClassExist");
        String className = "SE1762";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkClassExist(className);
        assertEquals(className, result.getName());
    }
    
    @Test
    public void testCheckClassExist1() {
        System.out.println("checkClassExist");
        String className = "SE1763";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkClassExist(className);
        assertNull(result);
    }
    
    @Test
    public void testCheckClassExist2() {
        System.out.println("checkClassExist");
        String className = "SE1753";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkClassExist(className);
        assertEquals(className, result.getName());
    }
    
    @Test
    public void testCheckClassExist3() {
        System.out.println("checkClassExist");
        String className = "";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkClassExist(className);
        assertNull(result);
    }

    /**
     * Test of checkMeetExist method, of class GroupDBContext.
     */
    @Test
    public void testCheckMeetExist() {
        System.out.println("checkMeetExist");
        String link_url = "12345";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkMeetExist(link_url);
        assertEquals(link_url, result.getLink_url());
    }
    
    @Test
    public void testCheckMeetExist1() {
        System.out.println("checkMeetExist");
        String link_url = "meet.google.com/xcs-aron-wyz";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkMeetExist(link_url);
        assertEquals(link_url, result.getLink_url());
    }
    
    @Test
    public void testCheckMeetExist2() {
        System.out.println("checkMeetExist");
        String link_url = "meet.google.com/vgb-sgsx-niu";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkMeetExist(link_url);
        assertEquals(link_url, result.getLink_url());
    }
    
    @Test
    public void testCheckMeetExist3() {
        System.out.println("checkMeetExist");
        String link_url = "meet.google.com/zpt-fpsq-gik";
        GroupDBContext instance = new GroupDBContext();
        
        Group result = instance.checkMeetExist(link_url);
        assertEquals(link_url, result.getLink_url());
    }

    /**
     * Test of getInstructorGroup method, of class GroupDBContext.
     */
    @Test
    public void testGetInstructorGroup() {
        System.out.println("getInstructorGroup");
        String id = "1";
        String class_name="SE1760";
        String class_id="2";
        int csm_id=5;
        GroupDBContext instance = new GroupDBContext();
        int size = 17;
        ArrayList<Group> result = instance.getInstructorGroup(id);
        assertEquals(size, result.size());
        assertEquals(class_name, result.get(0).getName());
        assertEquals(class_id, result.get(0).getId());
        assertEquals(csm_id, result.get(0).getGsm().getId());
    }
    
    @Test
    public void testGetInstructorGroup1() {
        System.out.println("getInstructorGroup");
        String id = "";
        GroupDBContext instance = new GroupDBContext();
        
        int size =0;
        ArrayList<Group> result = instance.getInstructorGroup(id);
        assertEquals(size, result.size());
    }

    /**
     * Test of getStudentGroup method, of class GroupDBContext.
     */
    @Test
    public void testGetStudentGroup() {
        System.out.println("getStudentGroup");
        String stuid = "1";
        String sub_name="SWP391";
        String class_name="thai";
        int csm_id = 33;
        String stu_name="Trần Văn A";
        int size = 28;
        GroupDBContext instance = new GroupDBContext();
        assertNotNull(instance);
        ArrayList<Group> result = instance.getStudentGroup(stuid);
        assertEquals(size, result.size());
        assertEquals(sub_name, result.get(5).getSubject().getName());
        assertEquals(class_name, result.get(5).getName());
        assertEquals(csm_id, result.get(5).getGsm().getId());
        assertEquals(stu_name, result.get(5).getStudent().getName());
        assertEquals(stuid, result.get(5).getStudent().getId());
    }
}
