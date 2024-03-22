/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.Group;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class PaginationDBContextTest {
    
    public PaginationDBContextTest() {
    }

    /**
     * Test of getListByPage method, of class PaginationDBContext.
     */
    @Test
    public void testGetListByPage() {
        System.out.println("getListByPage");
        
        List<Group> list = new ArrayList<>();
        
        Group gr1 = new Group();
        gr1.setName("Class A");
        list.add(gr1);
        
        Group gr2 = new Group();
        gr2.setName("Class B");
        list.add(gr2);
        
        Group gr3 = new Group();
        gr3.setName("Class C");
        list.add(gr3);
        
        Group gr4 = new Group();
        gr4.setName("Class D");
        list.add(gr4);
        
        Group gr5 = new Group();
        gr5.setName("Class E");
        list.add(gr5);
        
        Group gr6 = new Group();
        gr6.setName("Class F");
        list.add(gr6);
        
        Group gr7 = new Group();
        gr7.setName("Class G");
        list.add(gr7);
        
        Group gr8 = new Group();
        gr8.setName("Class H");
        list.add(gr8);
        
        int start = 0;
        int end = 6;
        
        PaginationDBContext instance = new PaginationDBContext();
        
        List<Group> result = instance.getListByPage(list, start, end);
    }
    
}
