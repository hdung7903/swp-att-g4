/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Group;
import entity.Registion;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class RegistionDBContextTest {
    
    public RegistionDBContextTest() {
    }

    /**
     * Test of enrollClass method, of class RegistionDBContext.
     */
//    @Test
//    public void testEnrollClass() {
//        System.out.println("enrollClass");
//        
//        Registion enroll = new Registion();
//        Group gr = new Group();
//        Student stu = new Student();
//        gr.setId("22");
//        stu.setId("15");
//        enroll.setGroup(gr);
//        enroll.setStudent(stu);
//        
//        RegistionDBContext instance = new RegistionDBContext();
//        
//        instance.enrollClass(enroll);
//    }

    /**
     * Test of checkStudentExist method, of class RegistionDBContext.
     */
    @Test
    public void testCheckStudentExist() {
        System.out.println("checkStudentExist");
        String class_id = "28";
        String student_id = "10";
        int regis_id = 67;
        
        RegistionDBContext instance = new RegistionDBContext();
        
        Registion result = instance.checkStudentExist(class_id, student_id);
        assertNotNull(result);
        assertEquals(regis_id, result.getId());
    }

    /**
     * Test of getAllRegistion method, of class RegistionDBContext.
     */
    @Test
    public void testGetAllRegistion() {
        System.out.println("getAllRegistion");
        RegistionDBContext instance = new RegistionDBContext();
        Student stu = new Student();
        Group gr = new Group();
        Registion reg = new Registion();
        stu.setId("1");
        stu.setName("Nguyễn Văn A");
        gr.setId("17");
        gr.setName("thai12");
        reg.setGroup(gr);
        reg.setStudent(stu);
        
        int size = 5;
        List<Registion> result = instance.getAllRegistion();
        assertEquals(size, result.size());
        assertEquals(reg.getGroup().getId(), result.get(0).getGroup().getId());
        assertEquals(reg.getGroup().getName(), result.get(0).getGroup().getName());
        assertEquals(reg.getStudent().getId(), result.get(0).getStudent().getId());
        assertEquals(reg.getStudent().getName(), result.get(0).getStudent().getName());
    }

    /**
     * Test of deleteRes method, of class RegistionDBContext.
     */
    @Test
    public void testDeleteRes() {
        System.out.println("deleteRes");
        String regis_id = "";
        RegistionDBContext instance = new RegistionDBContext();
        instance.deleteRes(regis_id);
    }
    
}
