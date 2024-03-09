/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.GroupSubjectMapping;
import entity.Instructor;
import entity.Student;
import entity.StudentClassMapping;
import entity.Subject;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author leduy
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
        String sql = "SELECT * FROM class ORDER BY class_id DESC LIMIT 1;";
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
        String sql = "SELECT * FROM class;";
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

    public ArrayList<Group> getInstructorGroup(String iid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "Select c.class_name,c.class_id,csm.csm_id\n"
                    + "From Class c\n"
                    + "INNER JOIN class_subject_mapping csm ON csm.class_id=c.class_id\n"
                    + "where csm.instructor_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, iid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setName(rs.getString("class_name"));
                g.setId(rs.getString("class_id"));
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                g.setGsm(gsm);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<Group> getStudentGroup(String stuid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT su.subject_name,c.class_name,csm.csm_id,s.student_id, s.student_name \n"
                    + "FROM class_subject_mapping csm\n"
                    + "INNER JOIN class c ON c.class_id=csm.class_id\n"
                    + "INNER JOIN subject su ON su.subject_id=csm.subject_id \n"
                    + "INNER JOIN student_class_mapping scm ON scm.class_id=c.class_id\n"
                    + "INNER JOIN student s ON s.student_id=scm.student_id\n"
                    + "WHERE s.student_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, stuid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setName(rs.getString("class_name"));
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                g.setGsm(gsm);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                g.setSubject(subject);
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                g.setStudent(student);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

}
