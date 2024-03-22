/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Group;
import entity.Instructor;
import entity.Session;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendances(int session_id) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = """
                         SELECT DISTINCT stu.student_id,stu.student_name,
                            IFNULL(a.status, 0) AS status,
                            IFNULL(a.att_description, 'nothing') AS att_description,
                            IFNULL(a.att_datetime, NOW()) AS att_datetime,
                            a.session_id
                         FROM Session ses 
                         INNER JOIN Class_subject_mapping csm ON csm.csm_id = ses.csm_id
                         INNER JOIN Attendance a ON a.session_id = ses.session_id
                         INNER JOIN Student stu ON stu.student_id = a.student_id
                         INNER JOIN Class c ON c.class_id = csm.class_id
                         WHERE ses.session_id = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, session_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student student = new Student();
                Session session = new Session();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                session.getStudent();
                session.setId(rs.getInt("session_id"));
                att.setStudent(student);
                att.setSession(session);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("att_description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public Map<String, Student> getAttendanceRecords(int groupId) throws SQLException {
        Map<String, Student> attendanceMap = new HashMap<>();

        String sql = """
                     SELECT DISTINCT s.student_name, a.status,s.email,s.student_id,ses.session_index,ses.session_id,i.instructor_name,su.subject_name
                     FROM Class c 
                     INNER JOIN class_subject_mapping csm ON csm.class_id=c.class_id
                     INNER JOIN student_class_mapping scm ON scm.class_id=c.class_id
                     INNER JOIN Session ses ON ses.csm_id=csm.csm_id
                     INNER JOIN Student s ON s.student_id=scm.student_id
                     INNER JOIN Instructor i ON i.instructor_id=csm.instructor_id
                     INNER JOIN Subject su ON su.subject_id=csm.subject_id
                     LEFT JOIN Attendance a ON ses.session_id=a.session_id AND a.student_id=scm.student_id
                     WHERE csm.csm_id = ? AND (ses.isAtt = 1 AND ses.isAtt IS NOT NULL)
                     ORDER BY s.student_id,ses.session_index;""";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, groupId);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    String studentId = rs.getString("student_id");
                    String studentName = rs.getString("student_name");
                    String email = rs.getString("email");
                    String instructorName = rs.getString("instructor_name");
                    String subjectName = rs.getString("subject_name");
                    Boolean status = rs.getBoolean("status");

                    Student student = attendanceMap.computeIfAbsent(studentId, k -> new Student(studentName, new Instructor(instructorName), new Subject(subjectName), email, new ArrayList<>()));
                    student.getAttendances().add(status);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendanceMap;
    }

    public int sessionAttended(int groupId) {
        int sessionCount = 0;

        String sql = """
                     SELECT COUNT(DISTINCT s.session_index) AS SessionCount
                     FROM Session s
                     JOIN class_subject_mapping csm ON csm.csm_id=s.csm_id
                     JOIN Class c ON c.class_id=csm.class_id
                     JOIN Attendance a ON a.session_id = s.session_id
                     WHERE csm.csm_id=?  AND s.isAtt=1""";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, groupId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                sessionCount = resultSet.getInt("SessionCount");
            }
        } catch (SQLException e) {
        }

        return sessionCount;
    }

    public List<Attendance> getStudentAttendanceRecords(String stuId, int csmId) throws SQLException {
        List<Attendance> statusRecord = new ArrayList<>();

        String sql = """
                     SELECT DISTINCT s.student_name, a.status, ses.ses_date, s.student_id, ses.session_index,ses.isAtt ,ses.session_id,i.instructor_name, su.subject_name, a.att_datetime, a.att_description, ts.description,c.class_name 
                     FROM Class c
                     INNER JOIN class_subject_mapping csm ON csm.class_id = c.class_id
                     INNER JOIN student_class_mapping scm ON scm.class_id = c.class_id
                     INNER JOIN Session ses ON ses.csm_id = csm.csm_id
                     INNER JOIN Student s ON s.student_id = scm.student_id
                     INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id
                     INNER JOIN Subject su ON su.subject_id = csm.subject_id
                     LEFT JOIN Attendance a ON ses.session_id = a.session_id AND a.student_id = scm.student_id
                     INNER JOIN TimeSlot ts ON ts.timeslot_id = ses.timeslot_id
                     WHERE (s.student_id = ? AND csm.csm_id = ?)
                     ORDER BY s.student_id, ses.session_index;""";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, stuId);
            stm.setInt(2, csmId);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Attendance att = new Attendance();
                    Student student = new Student();
                    student.setName(rs.getString("student_name"));
                    att.setStudent(student);
                    Session ses = new Session();
                    ses.setIndex(rs.getInt("session_index"));
                    ses.setId(rs.getInt("session_id"));
                    ses.setIsAtt(rs.getBoolean("isAtt"));
                    ses.setDate(rs.getDate("ses_date"));
                    att.setSession(ses);
                    Instructor instructor = new Instructor();
                    instructor.setName(rs.getString("instructor_name"));
                    att.setInstructor(instructor);
                    TimeSlot ts = new TimeSlot();
                    ts.setDescription(rs.getString("description"));
                    att.setTimeslot(ts);
                    Group group = new Group();
                    group.setName(rs.getString("class_name"));
                    att.setGroup(group);
                    att.setStatus(rs.getBoolean("status"));
                    att.setDescription(rs.getString("att_description") != null ? rs.getString("att_description") : "  ");
                    att.setDatetime(rs.getDate("att_datetime"));
                    statusRecord.add(att);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return statusRecord;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
