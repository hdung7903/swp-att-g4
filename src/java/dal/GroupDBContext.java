/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anhye
 */
public class GroupDBContext extends DBContext<Group> {

    public void createClass(String name, String link_url) {
        try {
            String sql_create_class = "INSERT INTO Class (class_name, link_url) VALUES (?, ?);";
            PreparedStatement ps_create_class = connection.prepareStatement(sql_create_class);
            ps_create_class.setString(1, name);
            ps_create_class.setString(2, link_url);
            ps_create_class.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertClass(String class_id, String subject_id, String slot, String instructor_id) {
        try {
            String sql = "INSERT INTO Class_subject_mapping (class_id, subject_id, total_slots, instructor_id) VALUES (?,?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, class_id);
            ps.setString(2, subject_id);
            ps.setString(3, slot);
            ps.setString(4, instructor_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Group getClassNewset() {
        String sql = "SELECT * FROM swp391_g4_ver1.class ORDER BY class_id DESC LIMIT 1;";
        Group group = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                group = new Group(
                        rs.getString("class_id"),
                        rs.getString("class_name"),
                        rs.getString("link_url")
                );
                return group;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return group;
    }

    public List<Group> getAllClass() throws SQLException {
        List<Group> list = new ArrayList<>();
        String sql = "SELECT * FROM swp391_g4_ver1.class;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Group(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Group checkClassExist(String className) {
        String sql = "Select * from Class where class_name = ?";
        Group group = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, className);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                group = new Group(
                        rs.getString("class_name"),
                        rs.getString("link_url")
                );
                return group;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return group;
    }

    public Group checkMeetExist(String link_url) {
        String sql = "Select * from Class where link_url = ?";
        Group group = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, link_url);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                group = new Group(
                        rs.getString("class_name"),
                        rs.getString("link_url")
                );
                return group;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return group;
    }

    public static void main(String[] args) {
        GroupDBContext dbd = new GroupDBContext();
        Group g=dbd.checkClassExist("SE1767");
        System.out.println(g.getClass_name());
    }
    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
