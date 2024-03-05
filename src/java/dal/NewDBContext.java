/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.New;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class NewDBContext extends DBContext<New> {

    @Override
    public ArrayList<New> list() {
        ArrayList<New> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                Date createDate = rs.getDate("create_date");
                String title = rs.getString("title");
                String content = rs.getString("content");
                New news = new New(id, createDate, title, content);
                newsList.add(news);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return newsList;
    }

    public void insert(New entity) {
        try {
            String sql = "INSERT INTO news (title, content, create_date) VALUES (?, ?, NOW())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getTitle());
            stm.setString(2, entity.getContent());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void update(New entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(New entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public New get(New entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
