/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import entity.News;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Administrator
 */
public class NewsDBContextTest {
    
    public NewsDBContextTest() {
    }

    /**
     * Test of list method, of class NewsDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
        NewsDBContext instance = new NewsDBContext();
        String title = "Lịch Nghỉ Học" ;
        String content = "aaaa";
        
        int size=9;
        ArrayList<News> result = instance.list();
        assertEquals(size, result.size());
        assertEquals(title, result.get(0).getTitle());
        assertEquals(content, result.get(0).getContent());
    }

    /**
     * Test of insert method, of class NewsDBContext.
     */
//    @Test
//    public void testInsert() {
//        System.out.println("insert");
//        
//        News entity = new News();
//        entity.setTitle("Test News");
//        entity.setContent("This is a test news.");
//        
//        NewsDBContext instance = new NewsDBContext();
//        
//        instance.insert(entity);
//    }

    /**
     * Test of update method, of class NewsDBContext.
     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        NewsDBContext instance = new NewsDBContext();
//        News news = new News();
//        news.setTitle("Update News Test");
//        news.setContent("Đang viết hàm Test");
//        news.setId(5);
//        int size =1;
//        
//        instance.update(news);
//        ArrayList<News> result = instance.getContentById(news.getId());
//        assertEquals(size, result.size());
//        assertEquals(news.getContent(), result.get(0).getContent());
//        assertEquals(news.getTitle(), result.get(0).getTitle());
//    }

    /**
     * Test of delete method, of class NewsDBContext.
     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        News news = new News();
//        news.setId(13);
//        NewsDBContext instance = new NewsDBContext();
//        instance.delete(news);
//    }

    /**
     * Test of getContentById method, of class NewsDBContext.
     */
    @Test
    public void testGetContentById() {
        System.out.println("getContentById");
        NewsDBContext instance = new NewsDBContext();
        News news = new News();
        news.setTitle("Update News Test");
        news.setContent("Đang viết hàm Test");
        news.setId(5);
        int size =1;
        
        ArrayList<News> result = instance.getContentById(news.getId());
        assertEquals(size, result.size());
        assertEquals(news.getContent(), result.get(0).getContent());
        assertEquals(news.getTitle(), result.get(0).getTitle());
    }

    /**
     * Test of listNews method, of class NewsDBContext.
     */
    @Test
    public void testListNews() {
        System.out.println("listNews");
        NewsDBContext instance = new NewsDBContext();
        News news = new News();
        news.setTitle("Tý 12h nộp Lab1");
        news.setContent("SWT");
        news.setId(22);
        int size =9;
        
        ArrayList<News> result = instance.listNews();
        assertEquals(size, result.size());
        assertEquals(news.getContent(), result.get(0).getContent());
        assertEquals(news.getTitle(), result.get(0).getTitle());
        assertEquals(news.getId(), result.get(0).getId());
    }
    
}
