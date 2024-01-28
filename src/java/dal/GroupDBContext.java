/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.GroupSubjectMapping;
import entity.Instructor;
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
public class GroupDBContext extends DBContext<GroupSubjectMapping>{
    
    public ArrayList<GroupSubjectMapping> getGroupbyInstructor(int instructor_id) {
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
            stm.setInt(1, instructor_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                GroupSubjectMapping gsm = new GroupSubjectMapping();
                gsm.setId(rs.getInt("csm_id"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                gsm.setInstructor(instructor);
                Group group = new Group();
                group.setName(rs.getString("class_name"));
                gsm.setGroup(group);
                Subject subject = new Subject();
                subject.setName(rs.getString("subject_name"));
                gsm.setSubject(subject);
                groups.add(gsm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
