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

    public ArrayList<Session> getSessionsByInstrucor(String instructor_id, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT s.scheid,s.date,r.roomid,t.tid,t.tname,g.gid,g.gname,su.subid,subname,i.iid,i.iname,s.isAtt,c.cname \n"
                    + "FROM [Schedule] s INNER JOIN [Instructor] i ON i.iid = s.iid\n"
                    + "				INNER JOIN [Class_subject_mapping] g ON g.gid = s.gid\n"
                    + "				INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "                         INNER JOIN [Campus] c ON i.cid = c.cid\n"
                    + "		WHERE i.iid = ? AND s.[date] >= ? AND s.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_id);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setSession_id(rs.getInt("session_id"));
                session.setSession_date(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Instructor instructor = new Instructor();
                instructor.setInstructor_id(rs.getString("instructor_id"));
                instructor.setInstructor_name(rs.getString("instructor_name"));
                session.getInstructor();
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setGsm_id(rs.getInt("csm_id"));
                session.getGsm();
                Group group = new Group();
                group.setGroup_id(rs.getString("class_id"));
                group.setGroup_name(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.getGroup();
                Subject subject = new Subject();
                subject.setSubject_id(rs.getString("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                session.getSubject();
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
            String sql = "SELECT s.scheid,s.date,r.roomid,t.tid,t.tname,g.gid,g.gname,su.subid,subname,i.iid,i.iname,s.isAtt,c.cname \n"
                    + "FROM [Schedule] s INNER JOIN [Instructor] i ON i.iid = s.iid\n"
                    + "				INNER JOIN [Class_subject_mapping] g ON g.gid = s.gid\n"
                    + "				INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "                         INNER JOIN [Campus] c ON i.cid = c.cid\n"
                    + "		WHERE i.iid = ? AND s.[date] >= ? AND s.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setSession_id(rs.getInt("session_id"));
                session.setSession_date(rs.getDate("ses_date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Student student = new Student();
                student.setStudent_id(rs.getString("student_id"));
                student.setStudent_name(rs.getString("student_name"));
                session.getStudent();
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setGsm_id(rs.getInt("csm_id"));
                session.getGsm();
                Group group = new Group();
                group.setGroup_id(rs.getString("class_id"));
                group.setGroup_name(rs.getString("class_name"));
                group.setLink_url(rs.getString("link_url"));
                session.getGroup();
                Subject subject = new Subject();
                subject.setSubject_id(rs.getString("subject_id"));
                subject.setSubject_name(rs.getString("subject_name"));
                session.getSubject();
                Attendance att = new Attendance();
                att.setAtt_id(rs.getInt("att_id"));
                att.setStatus(rs.getBoolean("status"));
                session.getAttendance();
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
