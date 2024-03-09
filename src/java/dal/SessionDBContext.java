/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.Instructor;
import entity.Session;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> checkClassStart(Integer csm_id) {
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT * FROM session\n"
                + "Where csm_id = ? and isAtt = '1';";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, csm_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsByInstructor(String instructor_id, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT i.instructor_id, i.instructor_name, su.subject_name, c.class_name, c.link_url,s.session_id, s.session_index, s.ses_date, s.isAtt,csm.csm_id,t.timeslot_id \n"
                    + "FROM Session s\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = s.csm_id\n"
                    + "INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "INNER JOIN Timeslot t ON t.timeslot_id=s.timeslot_id \n"
                    + "WHERE i.instructor_id = ? AND s.ses_date >= ? AND s.ses_date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_id);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                session.setInstructor(instructor);
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                session.setGsm(gsm);
                Group group = new Group();
                group.setName(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                session.setSubject(subject);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("timeslot_id"));
                session.setTime(t);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsByInstructorToday(String instructor_id, Date day) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT i.instructor_id, i.instructor_name, su.subject_name, c.class_name, c.link_url,s.session_id, s.session_index, s.ses_date, s.isAtt,csm.csm_id,t.timeslot_id,t.description \n"
                    + "FROM Session s\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = s.csm_id\n"
                    + "INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "INNER JOIN Timeslot t ON t.timeslot_id=s.timeslot_id \n"
                    + "WHERE i.instructor_id = ? AND s.ses_date = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_id);
            stm.setDate(2, day);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                session.setInstructor(instructor);
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                session.setGsm(gsm);
                Group group = new Group();
                group.setName(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                session.setSubject(subject);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("timeslot_id"));
                t.setDescription(rs.getString("description"));
                session.setTime(t);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsByStudent(String student_id, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, su.subject_name, c.class_name, "
                    + "c.link_url, s.session_id, s.session_index, s.ses_date, s.isAtt, csm.csm_id, t.timeslot_id, a.status \n"
                    + "FROM Session s\n"
                    + "INNER JOIN Attendance a ON a.session_id = s.session_id\n"
                    + "INNER JOIN Student stu ON stu.student_id = a.student_id\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = s.csm_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "INNER JOIN Timeslot t ON t.timeslot_id = s.timeslot_id \n"
                    + "WHERE stu.student_id = ? AND s.ses_date >= ? AND s.ses_date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Attendance attendance = new Attendance();
                attendance.setStatus(rs.getBoolean("status"));
                session.setAttendance(attendance);
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                session.setStudent(student);
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                session.setGsm(gsm);
                Group group = new Group();
                group.setName(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                session.setSubject(subject);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("timeslot_id"));
                session.setTime(t);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionsByStudentToday(String student_id, Date day) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT stu.student_id, stu.student_name, su.subject_name, c.class_name, "
                    + "c.link_url, s.session_id, s.session_index, s.ses_date, s.isAtt, csm.csm_id, t.timeslot_id, a.status \n"
                    + "FROM Session s\n"
                    + "INNER JOIN Attendance a ON a.session_id = s.session_id\n"
                    + "INNER JOIN Student stu ON stu.student_id = a.student_id\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = s.csm_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN Subject su ON su.subject_id = csm.subject_id\n"
                    + "INNER JOIN Timeslot t ON t.timeslot_id = s.timeslot_id \n"
                    + "WHERE stu.student_id = ? AND s.ses_date = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            stm.setDate(2, day);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Attendance attendance = new Attendance();
                attendance.setStatus(rs.getBoolean("status"));
                session.setAttendance(attendance);
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                session.setStudent(student);
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                session.setGsm(gsm);
                Group group = new Group();
                group.setName(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                session.setSubject(subject);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("timeslot_id"));
                session.setTime(t);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public int getTotalSession(int gid, String iid) {
        int total = 0;
        try {

            String sql = "SELECT total_slots\n"
                    + "FROM class_subject_mapping\n"
                    + "WHERE csm_id= ? and instructor_id= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setString(2, iid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total_slots");
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void addAttendances(Session ses) {
        try {
            connection.setAutoCommit(false);
            String sql_update_isAtt = "UPDATE Session SET isAtt = 1 WHERE session_id =?";
            PreparedStatement stm_update_isAtt = connection.prepareStatement(sql_update_isAtt);
            stm_update_isAtt.setInt(1, ses.getId());
            stm_update_isAtt.executeUpdate();

            String sql_remove_atts = "DELETE FROM Attendance WHERE session_id =?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, ses.getId());
            stm_remove_atts.executeUpdate();

            String insertAttendanceQuery = "INSERT INTO Attendance (student_id, session_id, status, att_description, att_datetime) "
                    + "VALUES (?, ?, ?, ?,NOW())";
            PreparedStatement insertAttendanceStmt = connection.prepareStatement(insertAttendanceQuery);
            for (Attendance att : ses.getAtts()) {
                insertAttendanceStmt.setString(1, att.getStudent().getId());
                insertAttendanceStmt.setInt(2, ses.getId());
                insertAttendanceStmt.setBoolean(3, att.isStatus());
                insertAttendanceStmt.setString(4, att.getDescription());
                insertAttendanceStmt.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void createAttendances(Session ses) {
        try {
            connection.setAutoCommit(false);

            String insertAttendanceQuery = "INSERT INTO Attendance (student_id, session_id, status, att_datetime, att_description)\n"
                    + "SELECT stu.student_id, ses.session_id, 0, NOW(), NULL\n"
                    + "FROM Session ses\n"
                    + "INNER JOIN Class_subject_mapping csm ON csm.csm_id = ses.csm_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN student_class_mapping scm ON scm.class_id = c.class_id\n"
                    + "INNER JOIN Student stu ON stu.student_id = scm.student_id\n"
                    + "WHERE ses.session_id = ?";
            PreparedStatement insertAttendanceStmt = connection.prepareStatement(insertAttendanceQuery);
            insertAttendanceStmt.setInt(1, ses.getId());
            for (Attendance att : ses.getAtts()) {
                insertAttendanceStmt.setString(1, att.getStudent().getId());
                insertAttendanceStmt.setInt(2, ses.getId());
                insertAttendanceStmt.setBoolean(3, att.isStatus());
                insertAttendanceStmt.setString(4, att.getDescription());
                insertAttendanceStmt.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int getTotalSessionStudent(int gid, String stuid) {
        int total = 0;
        try {

            String sql = "SELECT csm.total_slots\n"
                    + "FROM class_subject_mapping csm\n"
                    + "INNER JOIN student_class_mapping scm ON scm.class_id=csm.class_id\n"
                    + "WHERE csm.csm_id= ? and scm.student_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setString(2, stuid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total_slots");
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(Session entity) {
        try {
            String sql = "SELECT s.session_id,s.ses_date,t.timeslot_id,t.description,c.class_id,c.class_name,su.subject_id,su.subject_name,i.instructor_id,i.instructor_name,s.isAtt,a.att_datetime\n"
                    + "FROM Session s \n"
                    + "INNER JOIN class_subject_mapping csm ON csm.csm_id=s.csm_id\n"
                    + "INNER JOIN Instructor i ON csm.instructor_id = i.instructor_id\n"
                    + "INNER JOIN Class c ON c.class_id = csm.class_id\n"
                    + "INNER JOIN TimeSlot t ON s.timeslot_id = t.timeslot_id\n"
                    + "INNER JOIN Subject su ON csm.subject_id = su.subject_id\n"
                    + "INNER JOIN Attendance a ON s.session_id = a.session_id\n"
                    + "WHERE s.session_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("session_id"));
                session.setDate(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("timeslot_id"));
                t.setDescription(rs.getString("description"));
                session.setTime(t);
                Group g = new Group();
                g.setId(rs.getString("class_id"));
                g.setName(rs.getString("class_name"));
                session.setGroup(g);
                Subject subject = new Subject();
                subject.setId(rs.getString("subject_id"));
                subject.setName(rs.getString("subject_name"));
                session.setSubject(subject);
                return session;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
