/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Subject;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class SubjectDBContextTest {
    
    public SubjectDBContextTest() {
    }

    /**
     * Test of checkSubjectExist method, of class SubjectDBContext.
     */
    @Test
    public void testCheckSubjectExist() {
        System.out.println("checkSubjectExist");
        String name = "SWP391";
        SubjectDBContext instance = new SubjectDBContext();
        
        Subject result = instance.checkSubjectExist(name);
        assertNotNull(result);
        assertEquals(name, result.getName());
    }

    /**
     * Test of insertSubject method, of class SubjectDBContext.
     */
//    @Test
//    public void testInsertSubject() {
//        System.out.println("insertSubject");
//        String subject_id = "14";
//        String subject_name = "CHN123";
//        
//        SubjectDBContext instance = new SubjectDBContext();
//        instance.insertSubject(subject_id, subject_name);
//        
//        Subject result = instance.checkSubjectExist(subject_name);
//        assertNotNull(result);
//        assertEquals(subject_name, result.getName());   
//        assertEquals(subject_id, result.getId());   
//    }

    /**
     * Test of getAllSubject method, of class SubjectDBContext.
     */
    @Test
    public void testGetAllSubject() throws Exception {
        System.out.println("getAllSubject");
        SubjectDBContext instance = new SubjectDBContext();
        Subject sub = new Subject();
        sub.setName("SWT301");
        
        int expResult = 13;
        
        List<Subject> result = instance.getAllSubject();
        assertEquals(expResult, result.size());
        assertEquals(sub.getName(), result.get(7).getName());
    }

    /**
     * Test of getUnassignedSubjects method, of class SubjectDBContext.
     */
   @Test
    public void testInsertSubjectAssignment() {
        System.out.println("insertSubjectAssignment");
        
        String instructorId = "4";
        List<String> subjectIds = new ArrayList<>();
        subjectIds.add("SWP391");
        subjectIds.add("FER202");
        
        SIMDBContext instance = new SIMDBContext();
        
        instance.insertSubjectAssignment(instructorId, subjectIds);
    }

    /**
     * Test of getAssignedSubjects method, of class SubjectDBContext.
     */
    @Test
    public void testDeleteSubjectAssignment() throws Exception {
        System.out.println("deleteSubjectAssignment");
        
        String instructorId = "4";
        List<String> subjectIds = new ArrayList<>();
        subjectIds.add("SWP391");
        subjectIds.add("FER202");
        
        SIMDBContext instance = new SIMDBContext();
        
        instance.deleteSubjectAssignment(instructorId, subjectIds);
    }
}
