/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Application;
import entity.Student;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class ApplicationDBContext extends DBContext<Application> {


    @Override
    public void update(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Application get(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Application entity) {
        try {
            String sql = "INSERT INTO application (student_id, create_date, content, type_id, isSend, isApprove, comment) "
                    + "VALUES (?, ?, ?, ?, false, false, NULL)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getStudent().getId());
            stm.setDate(2, entity.getCreate_date());
            stm.setString(3, entity.getContent());
            stm.setInt(4, entity.getType().getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    public ArrayList<Application> list() {
        ArrayList<Application> applications = new ArrayList<>();

        try {
            String sql = "SELECT a.app_id, a.content, a.create_date, a.student_id, s.student_name, a.isApprove, a.`comment` "
                    + "FROM application a "
                    + "INNER JOIN student s ON s.student_id = a.student_id "
                    + "INNER JOIN type_application t ON t.type_id = a.type_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String content = rs.getString("content");
                Date createDate = rs.getDate("create_date");
                boolean isApprove = rs.getBoolean("isApprove");
                String comment = rs.getString("comment");

                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));

                Application application = new Application();
                application.setId(rs.getInt("app_id"));
                application.setContent(content);
                application.setCreate_date(createDate);
                application.setStudent(student);
                application.setIsApprove(isApprove);
                application.setComment(comment);

                applications.add(application);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return applications;
    }
    
    public Application get(int id) {
        Application application = null;

        try {
            String sql = "SELECT a.app_id, a.content, a.create_date, a.student_id, s.student_name "
                    + "FROM application a "
                    + "INNER JOIN student s ON s.student_id = a.student_id "
                    + "INNER JOIN type_application t ON t.type_id = a.type_id "
                    + "WHERE a.app_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String content = rs.getString("content");
                Date createDate = rs.getDate("create_date");

                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));

                application = new Application();
                application.setId(rs.getInt("app_id"));
                application.setContent(content);
                application.setCreate_date(createDate);
                application.setStudent(student);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return application;
    }
    
    public ArrayList<Application> getAppByStudent(String student_id) {
        ArrayList<Application> appByStu = new ArrayList<>();

        try {
            String sql = "SELECT a.app_id, a.content, a.create_date, a.student_id, s.student_name, a.isApprove, a.`comment` "
                    + "FROM application a "
                    + "INNER JOIN student s ON s.student_id = a.student_id "
                    + "INNER JOIN type_application t ON t.type_id = a.type_id "
                    + "WHERE a.student_id = ? ORDER BY a.app_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String content = rs.getString("content");
                Date createDate = rs.getDate("create_date");
                boolean isApprove = rs.getBoolean("isApprove");
                String comment = rs.getString("comment");

                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));

                Application application = new Application();
                application.setId(rs.getInt("app_id"));
                application.setContent(content);
                application.setCreate_date(createDate);
                application.setStudent(student);
                application.setIsApprove(isApprove);
                application.setComment(comment);

                appByStu.add(application);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return appByStu;
    }
    
    public void updateIsSend(int appId) {
        try {
            String sql = "UPDATE application SET isSend = 1 WHERE app_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, appId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    
    }
    
    public void updateIsApprove(int appId, boolean isApprove, String comment, boolean isSend ) {
        try {
            String sql = "UPDATE application SET isApprove = ?, comment = ?, isSend = ? WHERE app_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, isApprove);
            stm.setString(2, comment);
            stm.setBoolean(3, isSend);
            stm.setInt(4, appId);
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
