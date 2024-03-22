/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Instructor;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class InstructorDBContextTest {
    
    public InstructorDBContextTest() {
    }

    /**
     * Test of getAllInstructor method, of class InstructorDBContext.
     */
    @Test
    public void testGetAllInstructor() throws Exception {
        System.out.println("getAllInstructor");
        InstructorDBContext instance = new InstructorDBContext();
        String name="Phạm Đức Thắng";
        String username="ThangPD";
        
        int size =4;
        List<Instructor> result = instance.getAllInstructor();
        assertEquals(size, result.size());
        assertEquals(name, result.get(3).getName());
        assertEquals(username, result.get(3).getUsername());
    }
}
