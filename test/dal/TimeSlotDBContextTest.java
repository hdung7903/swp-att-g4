/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.TimeSlot;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class TimeSlotDBContextTest {
    
    public TimeSlotDBContextTest() {
    }

    /**
     * Test of list method, of class TimeSlotDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
        TimeSlotDBContext instance = new TimeSlotDBContext();
        TimeSlot time = new TimeSlot();
        time.setId(1);
        time.setDescription("Morning");
        
        int expResult = 2;
        ArrayList<TimeSlot> result = instance.list();
        assertEquals(expResult, result.size());
        assertEquals(time.getId(), result.get(0).getId());
        assertEquals(time.getDescription(), result.get(0).getDescription());
    }
}
