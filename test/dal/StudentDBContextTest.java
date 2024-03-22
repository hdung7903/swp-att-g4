/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Student;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class StudentDBContextTest {
    
    public StudentDBContextTest() {
    }

    /**
     * Test of getAllStudent method, of class StudentDBContext.
     */
    @Test
    public void testGetAllStudent() throws Exception {
        System.out.println("getAllStudent");
        StudentDBContext instance = new StudentDBContext();
        Student stu = new Student();
        stu.setName("Nguyễn Văn R");
        stu.setEmail("student10@example.com");
        Student stu2 = new Student();
        stu2.setName("Nguyễn Văn A");
        stu2.setEmail("hongphuocle003@gmail.com");
        
        int size = 60;
        List<Student> result = instance.getAllStudent();
        assertNotNull(result);
        assertEquals(size, result.size());
        assertEquals(stu.getName(), result.get(1).getName());
        assertEquals(stu.getEmail(), result.get(1).getEmail());
        assertEquals(stu2.getName(), result.get(0).getName());
        assertEquals(stu2.getEmail(), result.get(0).getEmail());
    }

    /**
     * Test of getStudentbyStaff method, of class StudentDBContext.
     */
//   @Test
//    public void testGetStudentbyStaff() {
//        System.out.println("getStudentbyStaff");
//        
//        // Định nghĩa txtSearch
//        String txtSearch = "";
//        
//        StudentDBContext instance = new StudentDBContext();
//        
//        ArrayList<Student> result = instance.getStudentbyStaff(txtSearch);
//        
//        boolean contains = false;
//        for (Student student : result) {
//            if (student.getName().equals("A")) {
//                contains = true;
//                break;
//            }
//        }
//        assertTrue(contains);
//    }
}
