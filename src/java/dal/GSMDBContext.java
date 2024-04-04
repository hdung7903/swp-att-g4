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
public class GSMDBContext extends DBContext<GroupSubjectMapping> {

    public ArrayList<GroupSubjectMapping> getGroupbyInstructor(String instructor_id) {
        ArrayList<GroupSubjectMapping> groups = new ArrayList<>();
        try {
            String sql = "SELECT i.instructor_id, i.instructor_name, csm.csm_id,\n"
                    + "su.subject_name, c.class_id, c.class_name \n"
                    + "FROM Instructor i \n"
                    + "INNER JOIN Class_subject_mapping csm ON i.instructor_id = csm.instructor_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "WHERE i.instructor_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                gsm.setInstructor(instructor);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                gsm.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                gsm.setSubject(subject);
                groups.add(gsm);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GSMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<GroupSubjectMapping> getGroupsbySubject(String subject_name) {
        ArrayList<GroupSubjectMapping> groups = new ArrayList<>();
        try {
            String sql = "SELECT c.class_id, c.class_name, COUNT(scm.student_id) AS num_students,\n"
                    + "       su.subject_name, su.subject_id, csm.csm_id\n"
                    + "FROM Subject su \n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.subject_id = su.subject_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "LEFT JOIN Student_class_mapping scm ON scm.class_id = csm.class_id\n"
                    + "WHERE su.subject_name = ?\n"
                    + "GROUP BY c.class_id, c.class_name, su.subject_name, su.subject_id, csm.csm_id\n"
                    + "HAVING COUNT(scm.student_id) < 20;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subject_name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                Subject subject = new Subject();
                subject.setId(rs.getString("subject_id"));
                subject.setName(rs.getString("subject_name"));
                gsm.setSubject(subject);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                gsm.setGroup(group);
                int numStudents = rs.getInt("num_students");
                gsm.setNumStudents(numStudents);
                groups.add(gsm);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GSMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public GroupSubjectMapping checkClassExist(String subject_name) {
        String sql = "SELECT * FROM class_subject_mapping csm \n"
                + "INNER JOIN subject su on su.subject_id = csm.subject_id\n"
                + "Where su.subject_name= ?;";
        GroupSubjectMapping list = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subject_name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list = new GroupSubjectMapping(
                        rs.getInt("csm_id")
                );
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SCMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getGSM_Id(String subject_name, String class_id) {
        int gsm_Id = 0;
        try {
            String sql = "SELECT csm.csm_id\n"
                    + "FROM class_subject_mapping csm \n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "WHERE su.subject_name = ? AND c.class_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subject_name);
            stm.setString(2, class_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                gsm_Id = rs.getInt("csm_id");
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gsm_Id;
    }

    public ArrayList<GroupSubjectMapping> getGSMbyId(String csm_id) {
        ArrayList<GroupSubjectMapping> groups = new ArrayList<>();
        try {
            String sql = "SELECT i.instructor_id, i.instructor_name, csm.csm_id,\n"
                    + "su.subject_name, c.class_id, c.class_name \n"
                    + "FROM Instructor i \n"
                    + "INNER JOIN Class_subject_mapping csm ON i.instructor_id = csm.instructor_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "WHERE csm.csm_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, csm_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                gsm.setInstructor(instructor);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                gsm.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                gsm.setSubject(subject);
                groups.add(gsm);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GSMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    @Override
    public ArrayList<GroupSubjectMapping> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(GroupSubjectMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(GroupSubjectMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(GroupSubjectMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public GroupSubjectMapping get(GroupSubjectMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
