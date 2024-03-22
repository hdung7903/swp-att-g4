/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Instructor;
import entity.Subject;
import entity.SubjectInstructorMapping;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class SIMDBContextTest {
    
    public SIMDBContextTest() {
    }

    /**
     * Test of insertSubjectAssignment method, of class SIMDBContext.
     */
//   @Test
//    public void testInsertSubjectAssignment() {
//        System.out.println("insertSubjectAssignment");
//        
//        String instructorId = "4";
//        List<String> subjectIds = new ArrayList<>();
//        subjectIds.add("SWP391");
//        subjectIds.add("FER202");
//        
//        SIMDBContext instance = new SIMDBContext();
//        
//        instance.insertSubjectAssignment(instructorId, subjectIds);
//    }

    /**
     * Test of deleteSubjectAssignment method, of class SIMDBContext.
     */
//    @Test
//    public void testDeleteSubjectAssignment() throws Exception {
//        System.out.println("deleteSubjectAssignment");
//        
//        String instructorId = "4";
//        List<String> subjectIds = new ArrayList<>();
//        subjectIds.add("SWP391");
//        subjectIds.add("FER202");
//        
//        SIMDBContext instance = new SIMDBContext();
//        
//        instance.deleteSubjectAssignment(instructorId, subjectIds);
//    }

    /**
     * Test of getAllInstructorbySubject method, of class SIMDBContext.
     */
    @Test
    public void testGetAllInstructorbySubject() throws Exception {
        System.out.println("getAllInstructorbySubject");
        String subject_id = "10";
        SIMDBContext instance = new SIMDBContext();
        SubjectInstructorMapping sim = new SubjectInstructorMapping();
        Instructor ins = new Instructor();
        Subject sub = new Subject();
        ins.setId("1");
        sub.setId("10");
        sim.setInstructor(ins);
        sim.setSubject(sub);
        
        int size = 1;
        List<SubjectInstructorMapping> result = instance.getAllInstructorbySubject(subject_id);
        assertEquals(size, result.size());
        assertEquals(sim.getInstructor().getId(), result.get(0).getInstructor().getId());
        assertEquals(sim.getSubject().getId(), result.get(0).getSubject().getId());
    }
    
}
