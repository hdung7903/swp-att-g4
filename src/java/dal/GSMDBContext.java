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
 * @author leduy
 */
public class GSMDBContext extends DBContext<GroupSubjectMapping> {

    public GroupSubjectMapping getClassNewset() {
        String sql = "   Select csm_id, i.instructor_name,i.instructor_id, c.class_name, c.class_id, su.subject_name, su.subject_id from class_subject_mapping csm\n"
                + "   inner join instructor i on i.instructor_id = csm.instructor_id\n"
                + "   inner join class c on c.class_id = csm.class_id\n"
                + "   inner join subject su on su.subject_id = csm.subject_id\n"
                + "   ORDER BY csm_id DESC LIMIT 1 ;\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            GroupSubjectMapping gsm = new GroupSubjectMapping();
            while (rs.next()) {

                Instructor instructor = new Instructor();
                Group group = new Group();
                Subject subject = new Subject();

                String csm_id = rs.getString("csm_id");
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                subject.setId(rs.getString("subject_id"));
                subject.setName(rs.getString("subject_name"));

                gsm.setInstructor(instructor);
                gsm.setGroup(group);
                gsm.setSubject(subject);
            }
            return gsm;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkSubjectExist(String class_id, String subject_id) {
        String sql = "SELECT * FROM class_subject_mapping WHERE class_id = ? AND subject_id = ?";
        try {
            boolean subjectExists;
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, class_id);
                ps.setString(2, subject_id);
                try ( ResultSet rs = ps.executeQuery()) {
                    subjectExists = rs.next();
                }
            }
            return subjectExists;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
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
