/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Session;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
            String sql = "SELECT stu.student_id,stu.student_name,\n"
                    + "   IFNULL(a.status, 0) AS status,\n"
                    + "	  IFNULL(a.att_description, 'nothing') AS att_description,\n"
                    + "   IFNULL(a.att_datetime, NOW()) AS att_datetime,\n"
                    + "   a.session_id\n"
                    + "FROM Session ses \n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = ses.csm_id\n"
                    + "INNER JOIN Attendance a ON a.session_id = ses.session_id\n"
                    + "INNER JOIN Student stu ON stu.student_id = a.student_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "WHERE ses.session_id = ?";
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

    public Map<String, Student> getAttendanceRecords(String groupId) throws SQLException {
        Map<String, Student> attendanceMap = new HashMap<>();

        String sql = "SELECT s.student_name, a.status,s.email,s.student_id,ses.session_id\n"
                + "FROM Class c \n"
                + "INNER JOIN class_subject_mapping csm ON csm.class_id=c.class_id\n"
                + "INNER JOIN student_class_mapping scm ON scm.class_id=c.class_id\n"
                + "INNER JOIN Session ses ON ses.csm_id=csm.csm_id\n"
                + "INNER JOIN Student s ON s.student_id=scm.student_id\n"
                + "LEFT JOIN Attendance a ON ses.session_id=a.session_id AND a.student_id=scm.student_id\n"
                + "WHERE csm.csm_id = ? AND (ses.isAtt = 1 AND ses.isAtt IS NOT NULL)\n"
                + "ORDER BY s.student_id,ses.session_id;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, groupId);
            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    String studentName = rs.getString("student_name");
                    String email = rs.getString("email");
                    Boolean status = rs.getBoolean("status");

                    if (attendanceMap.containsKey(studentName)) {
                        // If the student is already in the map, just add the new status to their attendances
                        Student existingStudent = attendanceMap.get(studentName);
                        existingStudent.getAttendances().add(status);
                    } else {
                        // If the student is not in the map, create a new Student object and add it to the map
                        Student newStudent = new Student();
                        newStudent.setName(studentName);
                        newStudent.setEmail(email);
                        newStudent.setAttendances(new ArrayList<>(Arrays.asList(status)));
                        attendanceMap.put(studentName, newStudent);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendanceMap;
    }

    public int sessionAttended(String groupId) {
        int sessionCount = 0;

        String sql = "SELECT COUNT(DISTINCT s.session_index) AS SessionCount\n"
                + "FROM Session s\n"
                + "JOIN class_subject_mapping csm ON csm.csm_id=s.csm_id\n"
                + "JOIN Class c ON c.class_id=csm.class_id\n"
                + "JOIN Attendance a ON a.session_id = s.session_id\n"
                + "WHERE csm.csm_id=?  AND s.isAtt=1";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, groupId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                sessionCount = resultSet.getInt("SessionCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sessionCount;
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
