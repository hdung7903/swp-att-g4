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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class GSMDBContext extends DBContext<GroupSubjectMapping> {

    public ArrayList<GroupSubjectMapping> getGroupsbySubject(String subject_name) {
        ArrayList<GroupSubjectMapping> groups = new ArrayList<>();
        try {
            String sql = """
                         SELECT c.class_id, c.class_name, COUNT(scm.student_id) AS num_students,
                                su.subject_name, su.subject_id, csm.csm_id
                         FROM Subject su 
                         INNER JOIN Class_subject_mapping csm ON csm.subject_id = su.subject_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         LEFT JOIN Student_class_mapping scm ON scm.csm_id = csm.csm_id
                         WHERE su.subject_name = ?
                         GROUP BY c.class_id, c.class_name, su.subject_name, su.subject_id, csm.csm_id
                         HAVING COUNT(scm.student_id) < 20;""";
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
                gsm.setTotalStudent(numStudents);
                groups.add(gsm);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GSMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public GroupSubjectMapping getClassNewset() {
        String sql = """
                        Select csm_id, total_slots, i.instructor_name,i.instructor_id, c.class_name, c.class_id, su.subject_name, su.subject_id from class_subject_mapping csm
                        left join instructor i on i.instructor_id = csm.instructor_id
                        inner join class c on c.class_id = csm.class_id
                        inner join subject su on su.subject_id = csm.subject_id
                        ORDER BY csm_id DESC LIMIT 1 ;
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            GroupSubjectMapping gsm = new GroupSubjectMapping();
            while (rs.next()) {

                Instructor instructor = new Instructor();
                Group group = new Group();
                Subject subject = new Subject();

                String csm_id = rs.getString("csm_id");
                int slots = rs.getInt("total_slots");
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                subject.setId(rs.getString("subject_id"));
                subject.setName(rs.getString("subject_name"));

                gsm.setInstructor(instructor);
                gsm.setGroup(group);
                gsm.setSubject(subject);
                gsm.setTotal_slots(slots);
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
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, class_id);
                ps.setString(2, subject_id);
                try (ResultSet rs = ps.executeQuery()) {
                    subjectExists = rs.next();
                }
            }
            return subjectExists;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<GroupSubjectMapping> getAllClassbyClassId(String class_id) {
        List<GroupSubjectMapping> listGSM = new ArrayList<>();
        String sql = """
                     SELECT csm.csm_id, csm.total_slots, i.instructor_name, i.instructor_id, c.class_name, c.class_id, c.link_url, 
                         su.subject_name, su.subject_id,COUNT(scm.student_id) AS student_count
                     FROM class_subject_mapping csm 
                     LEFT JOIN instructor i ON i.instructor_id = csm.instructor_id
                     INNER JOIN class c ON c.class_id = csm.class_id
                     INNER JOIN subject su ON su.subject_id = csm.subject_id
                     LEFT JOIN student_class_mapping scm ON scm.csm_id = csm.csm_id
                     WHERE c.class_id = ?
                     GROUP BY csm.csm_id,  csm.total_slots, i.instructor_name, i.instructor_id, c.class_name, 
                         c.class_id, c.link_url, su.subject_name, su.subject_id;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, class_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("csm_id");
                int slots = rs.getInt("total_slots");
                int total_student = rs.getInt("student_count");
                String instructorId = rs.getString("instructor_id");
                String instructorName = rs.getString("instructor_name");
                String classId = rs.getString("class_id");
                String className = rs.getString("class_name");
                String linkUrl = rs.getString("link_url");
                String subjectId = rs.getString("subject_id");
                String subjectName = rs.getString("subject_name");

                Instructor instructor = new Instructor(instructorId, instructorName);
                Group group = new Group(classId, className, linkUrl);
                Subject subject = new Subject(subjectId, subjectName);

                GroupSubjectMapping gsm = new GroupSubjectMapping(id, group, subject, instructor, slots, total_student);

                listGSM.add(gsm);
            }
            return listGSM;
        } catch (SQLException e) {
        }
        return null;
    }

    public GroupSubjectMapping getClassByCsmId(String csm_id) {
        String sql = """
                     Select  csm_id, i.instructor_name,i.instructor_id, c.class_name, c.class_id, su.subject_name, su.subject_id, total_slots from class_subject_mapping csm 
                      LEFT JOIN instructor i on i.instructor_id = csm.instructor_id
                      inner join class c on c.class_id = csm.class_id
                      inner join subject su on su.subject_id = csm.subject_id
                      Where csm_id = ?;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, csm_id);
            ResultSet rs = st.executeQuery();
            GroupSubjectMapping gsm = new GroupSubjectMapping();
            while (rs.next()) {

                Instructor instructor = new Instructor();
                Group group = new Group();
                Subject subject = new Subject();

                int id = rs.getInt("csm_id");
                int slots = rs.getInt("total_slots");
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                group.setId(rs.getString("class_id"));
                group.setName(rs.getString("class_name"));
                subject.setId(rs.getString("subject_id"));
                subject.setName(rs.getString("subject_name"));

                gsm.setInstructor(instructor);
                gsm.setGroup(group);
                gsm.setSubject(subject);
                gsm.setTotal_slots(slots);
                gsm.setId(id);
            }
            return gsm;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateClass(GroupSubjectMapping gsm) {
        try {
            String sql = "UPDATE class_subject_mapping SET total_slots = ?, instructor_id = ? WHERE csm_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, gsm.getTotal_slots());
            ps.setString(2, String.valueOf(gsm.getInstructor().getId()));
            ps.setInt(3, gsm.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertClass(String class_id, String subject_id, String slot) {
        try {
            String sql = "INSERT INTO Class_subject_mapping (class_id, subject_id, total_slots) VALUES (?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, class_id);
            ps.setString(2, subject_id);
            ps.setString(3, slot);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteClass(String csm_id) {
        try {
            String sql = "DELETE FROM Class_subject_mapping WHERE csm_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, csm_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<GroupSubjectMapping> getGroupbyInstructor(String instructor_id) {
        ArrayList<GroupSubjectMapping> groups = new ArrayList<>();
        try {
            String sql = """
                         SELECT i.instructor_id, i.instructor_name, csm.csm_id,
                         su.subject_name, c.class_id, c.class_name 
                         FROM Instructor i 
                         INNER JOIN Class_subject_mapping csm ON i.instructor_id = csm.instructor_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         INNER JOIN Subject su ON su.subject_id = csm.subject_id
                         WHERE i.instructor_id = ?""";
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
            String sql = """
                         SELECT stu.student_id, stu.student_name, stu.email, c.class_id
                         FROM student stu 
                         INNER JOIN student_class_mapping scm ON stu.student_id = scm.student_id
                         inner join class c on c.class_id = scm.class_id
                         where c.class_id = ?
                         ORDER BY stu.student_id""";
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
            String sql = """
                         SELECT i.instructor_id, i.instructor_name, csm.csm_id,
                         su.subject_name, c.class_id, c.class_name 
                         FROM Instructor i 
                         INNER JOIN Class_subject_mapping csm ON i.instructor_id = csm.instructor_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         INNER JOIN Subject su ON su.subject_id = csm.subject_id
                         WHERE csm.csm_id = ?""";
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

    public int getGSM_Id(String subject_name, String class_id) {
        int gsm_Id = 0;
        try {
            String sql = """
                         SELECT csm.csm_id
                         FROM class_subject_mapping csm 
                         INNER JOIN Subject su ON su.subject_id = csm.subject_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         WHERE su.subject_name = ? AND c.class_id = ?""";
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
