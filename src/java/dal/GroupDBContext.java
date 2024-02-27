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
public class GroupDBContext extends DBContext<GroupSubjectMapping> {

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
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<StudentClassMapping> getGroupbyStudent(String student_id) {
        ArrayList<StudentClassMapping> groups = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, stu.email, c.class_id, su.subject_name, c.class_name\n"
                    + "FROM student stu \n"
                    + "INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id\n"
                    + "inner join class c on c.class_id = scm.class_id\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.class_id = c.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "where stu.student_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                StudentClassMapping scm = new StudentClassMapping();
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                scm.setStudent(student);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                scm.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                scm.setSubject(subject);
                groups.add(scm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<StudentClassMapping> getStudentbyInstructor(String txtSearch, String instructor_id) {
        ArrayList<StudentClassMapping> students = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, stu.email, MIN(c.class_id) AS class_id\n"
                    + "FROM student stu \n"
                    + "INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id\n"
                    + "INNER JOIN class c ON c.class_id = scm.class_id\n"
                    + "INNER JOIN class_subject_mapping csm ON csm.class_id = c.class_id\n"
                    + "INNER JOIN instructor i ON i.instructor_id = csm.instructor_id\n"
                    + "WHERE i.instructor_id = ?";
            if (txtSearch != null && !txtSearch.equals("")) {
                sql += " AND CONCAT(stu.student_id, stu.student_name, stu.email) LIKE '%" + txtSearch + "%'";
            }
            sql += "GROUP BY stu.student_id, stu.student_name, stu.email;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                StudentClassMapping scm = new StudentClassMapping();
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                scm.setStudent(student);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                scm.setGroup(group);
                students.add(scm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<Student> getStudentbyStaff(String txtSearch) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT student_id, student_name, email\n"
                    + "FROM student ";
            if (txtSearch != null && !txtSearch.equals("")) {
                sql += "WHERE CONCAT(student_id, student_name, email) LIKE ?";
            }
            sql += " GROUP BY student_id, student_name, email;";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (txtSearch != null && !txtSearch.equals("")) {
                stm.setString(1, "%" + txtSearch + "%");
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                students.add(student);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<StudentClassMapping> getStudentbyGroup(String class_id) {
        ArrayList<StudentClassMapping> students = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, stu.email, c.class_id\n"
                    + "FROM student stu \n"
                    + "INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id\n"
                    + "inner join class c on c.class_id = scm.class_id\n"
                    + "where c.class_id = ?"
                    + "ORDER BY stu.student_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, class_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                StudentClassMapping scm = new StudentClassMapping();
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                scm.setStudent(student);
                Group group = new Group();
                group.setId(rs.getString("class_id"));
                scm.setGroup(group);
                students.add(scm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
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
