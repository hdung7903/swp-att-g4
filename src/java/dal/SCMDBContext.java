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
public class SCMDBContext extends DBContext<StudentClassMapping> {

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

    public ArrayList<StudentClassMapping> getGroupbyStudent(String student_id) {
        ArrayList<StudentClassMapping> groups = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, stu.email, c.class_id, su.subject_name, c.class_name, i.instructor_name, csm.csm_id\n"
                    + "FROM student stu \n"
                    + "INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id\n"
                    + "inner join class c on c.class_id = scm.class_id\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.class_id = c.class_id\n"
                    + "INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id\n"
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
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                scm.setGsm(gsm);
                Instructor instructor = new Instructor();
                instructor.setName(rs.getString("instructor_name"));
                scm.setInstructor(instructor);
                groups.add(scm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentClassMapping.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public void enrollClass(StudentClassMapping enroll) {
        try {

            String sql = "INSERT INTO student_class_mapping (class_id, student_id) \n"
                    + "VALUES (?, ?);";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, enroll.getGroup().getId());
            stm.setString(2, enroll.getStudent().getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(StudentClassMapping.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(StudentClassMapping.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    public StudentClassMapping checkStudentExist(String class_id, String student_id) {
        String sql = "SELECT * FROM student_class_mapping\n"
                + "Where class_id = ? and student_id= ?;";
        StudentClassMapping list = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, class_id);
            stm.setString(2, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list = new StudentClassMapping(
                        rs.getInt("scm_id")
                );
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SCMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public StudentClassMapping checkSubjectLearned(String subject_name, String student_id) {
        String sql = "SELECT * FROM student_class_mapping scm\n"
                + "INNER JOIN class c on c.class_id = scm.class_id\n"
                + "INNER JOIN Class_subject_mapping csm ON csm.class_id = c.class_id\n"
                + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                + "Where su.subject_name = ? and scm.student_id= ?;";
        StudentClassMapping list = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subject_name);
            stm.setString(2, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list = new StudentClassMapping(
                        rs.getInt("scm_id")
                );
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SCMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ArrayList<StudentClassMapping> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(StudentClassMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(StudentClassMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(StudentClassMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public StudentClassMapping get(StudentClassMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
