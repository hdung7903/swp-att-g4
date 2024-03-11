/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.News;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class NewsDBContext extends DBContext<News> {

    @Override
    public ArrayList<News> list() {
         ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "FROM news";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("news_id");
                Date createDate = rs.getDate("date");
                String title = rs.getString("title");
                String content = rs.getString("content");
                News news = new News(id,title,content,createDate);
                newsList.add(news);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return newsList;
    }

    @Override
    public void insert(News entity) {
         try {
            String sql = "INSERT INTO news (title, content, date) VALUES (?, ?, NOW())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getTitle());
            stm.setString(2, entity.getContent());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void update(News entity) {
         try {
            String sql = "UPDATE news SET title = ?, content = ? WHERE news_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getTitle());
            stm.setString(2, entity.getContent());
            stm.setInt(3, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void delete(News entity) {
        try {
            String sql = "DELETE FROM news WHERE news_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public News get(News entity) {
       throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<News> getContentById(int id) {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news where news_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                Date createDate = rs.getDate("date");
                String title = rs.getString("title");
                String content = rs.getString("content");
                News news = new News(id, title, content, createDate);
                newsList.add(news);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return newsList;
    }
    public ArrayList<News> listNews() {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news order by news_id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("news_id");
                Date createDate = rs.getDate("date");
                String title = rs.getString("title");
                String content = rs.getString("content");
                News news = new News(id, title, content,createDate);
                newsList.add(news);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return newsList;
    }
}
