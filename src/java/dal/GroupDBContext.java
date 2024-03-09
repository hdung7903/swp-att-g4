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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class GroupDBContext extends DBContext<Group> {

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
