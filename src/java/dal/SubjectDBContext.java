/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leduy
 */
public class SubjectDBContext extends DBContext<Subject> {

    public Subject checkSubjectExist(String name) {
        String sql = "Select * from Subject where subject_name = ?";
        Subject subject = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                subject = new Subject(
                        rs.getString("subject_id"),
                        rs.getString("subject_name")
                );
                return subject;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subject;
    }

    public void insertSubject(String subject_id, String subject_name) {
        try {
            String sql_create_class = "INSERT INTO Subject (subject_id, subject_name) VALUES (?, ?);";
            PreparedStatement ps_create_class = connection.prepareStatement(sql_create_class);
            ps_create_class.setString(1, subject_id);
            ps_create_class.setString(2, subject_name);
            ps_create_class.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Subject> getAllSubject() throws SQLException {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT * FROM subject;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Subject> getUnassignedSubjects(String instructorId) throws SQLException {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM subject\n"
                + "WHERE subject_id NOT IN (\n"
                + "  SELECT subject_id\n"
                + "  FROM subject_instructor_mapping\n"
                + "  WHERE instructor_id IN (?)\n"
                + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, instructorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Subject> getAssignedSubjects(String instructorId) throws SQLException {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM subject\n"
                + "WHERE subject_id  IN (\n"
                + "SELECT subject_id\n"
                + "FROM subject_instructor_mapping\n"
                + "WHERE instructor_id IN (?)\n"
                + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, instructorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
