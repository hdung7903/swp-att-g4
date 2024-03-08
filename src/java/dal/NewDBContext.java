package dal;

import entity.New;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewDBContext extends DBContext<New> {

    @Override
    public ArrayList<New> list() {
        ArrayList<New> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM new";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
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

    @Override
    public void insert(New entity) {
        try {
            String sql = "INSERT INTO new (title, content, create_date) VALUES (?, ?, NOW())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getTitle());
            stm.setString(2, entity.getContent());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<New> getContentById(int id) {
        ArrayList<New> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM new where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

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

    @Override
    public void update(New entity) {
        try {
            String sql = "UPDATE new SET title = ?, content = ? WHERE id = ?";
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
    public void delete(New entity) {
        try {
            String sql = "DELETE FROM new WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public New get(New entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<New> listNews() {
        ArrayList<New> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM new order by id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
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
    
}
