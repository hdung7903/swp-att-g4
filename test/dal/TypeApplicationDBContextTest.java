/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.TypeApplication;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class TypeApplicationDBContextTest {
    
    public TypeApplicationDBContextTest() {
    }

    /**
     * Test of list method, of class TypeApplicationDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
         TypeApplication type = new TypeApplication();
         TypeApplicationDBContext instance = new TypeApplicationDBContext();
        type.setId(1);
        type.setName("Application for exemption from attendance");
        
        int expResult = 3;
        ArrayList<TypeApplication> result = instance.list();
        assertEquals(expResult, result.size());
        assertEquals(type.getId(), result.get(0).getId());
        assertEquals(type.getName(), result.get(0).getName());
    }
}
