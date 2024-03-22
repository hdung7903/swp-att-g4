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
public class SCMDBContext extends DBContext<StudentClassMapping> {

    public StudentClassMapping checkStudentExist(int csm_id, String student_id) {
        String sql = """
                     SELECT * FROM student_class_mapping
                     Where csm_id = ? and student_id= ?;""";
        StudentClassMapping list = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, csm_id);
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

    public void insertStuinClass(String student_id, String class_id, String csm_id) {
        try {
            String sql = "INSERT INTO student_class_mapping (student_id, class_id, csm_id) VALUES (?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, student_id);
            ps.setString(2, class_id);
             ps.setString(3, csm_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void approveRegis(String regis_id) {
        try {
            String sql = """
                         INSERT INTO student_class_mapping (student_id, class_id, csm_id)
                                                  SELECT student_id, class_id, csm_id
                                                  FROM registion
                                                  WHERE regis_id = ?;""";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, regis_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int countStudent(String csm_id) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS count FROM student_class_mapping WHERE csm_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, csm_id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("count");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public StudentClassMapping checkSubjectLearnning(String subject_name, String student_id) {
        String sql = """
                     SELECT * FROM student_class_mapping scm
                                          INNER JOIN Class_subject_mapping csm ON csm.csm_id = scm.csm_id
                                          INNER JOIN Subject su ON su.subject_id = csm.subject_id
                                          Where su.subject_name = ? and scm.student_id= ?;""";
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

    public ArrayList<StudentClassMapping> getGroupbyStudent(String student_id) {
        ArrayList<StudentClassMapping> groups = new ArrayList<>();
        try {
            String sql = """
                         SELECT stu.student_id, stu.student_name, stu.email, c.class_id, su.subject_name, c.class_name, i.instructor_name, csm.csm_id
                         FROM student stu 
                         INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id
                         INNER JOIN Class_subject_mapping csm ON csm.csm_id = scm.csm_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id
                         INNER JOIN Subject su ON su.subject_id = csm.subject_id
                         where stu.student_id = ?;""";
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

    public ArrayList<StudentClassMapping> getStudentbyCMS(String csm_id) {
        ArrayList<StudentClassMapping> students = new ArrayList<>();
        try {
            String sql = """
                        SELECT stu.student_id, stu.student_name, stu.email, csm.class_id
                                                  FROM student stu 
                                                  INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id
                                                  inner join class_subject_mapping csm on csm.csm_id = scm.csm_id
                                                  where csm.csm_id = ? ORDER BY stu.student_id""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, csm_id);
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

    public ArrayList<StudentClassMapping> getStudentbyInstructor(String txtSearch, String instructor_id) {
        ArrayList<StudentClassMapping> students = new ArrayList<>();
        try {
            String sql = """
                         SELECT stu.student_id, stu.student_name, stu.email, MIN(c.class_id) AS class_id
                         FROM student stu 
                         INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id
                         INNER JOIN class c ON c.class_id = scm.class_id
                         INNER JOIN class_subject_mapping csm ON csm.class_id = c.class_id
                         INNER JOIN instructor i ON i.instructor_id = csm.instructor_id
                         WHERE i.instructor_id = ?""";
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
    
    public static void main(String[] args) {
        SCMDBContext scm = new SCMDBContext();
        int count = scm.countStudent("17");
        System.out.println(count);
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
