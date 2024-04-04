/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
 * @author Admin
 */
public class SubjectDBContext extends DBContext<Subject> {

    public ArrayList<Subject> getSubjectLearned(String student_id) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT distinct su.subject_name\n"
                    + "FROM student_class_mapping scm\n"
                    + "INNER JOIN class_subject_mapping csm on csm.class_id = scm.class_id\n"
                    + "INNER JOIN subject su on su.subject_id =  csm.subject_id\n"
                    + "where scm.student_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                subjects.add(subject);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    public ArrayList<Subject> getSubjectNotLearned(String student_id) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT s.subject_name\n"
                    + "FROM subject s\n"
                    + "WHERE s.subject_id NOT IN (\n"
                    + "    SELECT csm.subject_id\n"
                    + "    FROM class_subject_mapping csm\n"
                    + "    INNER JOIN student_class_mapping scm ON csm.class_id = scm.class_id\n"
                    + "    WHERE scm.student_id = ?\n"
                    + ");";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                subjects.add(subject);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    public ArrayList<Subject> getSubjectRegisted(String student_id) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT distinct su.subject_name\n"
                    + "FROM registion reg\n"
                    + "INNER JOIN class_subject_mapping csm on csm.csm_id = reg.csm_id\n"
                    + "INNER JOIN subject su on su.subject_id =  csm.subject_id\n"
                    + "where reg.student_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                subjects.add(subject);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
