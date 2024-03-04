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
import java.util.List;

/**
 *
 * @author Administrator
 */
public class GSMDBContext extends DBContext<GroupSubjectMapping>{
    
    public GroupSubjectMapping getClassNewset() {
        String sql = """
                        Select csm_id, i.instructor_name,i.instructor_id, c.class_name, c.class_id, su.subject_name, su.subject_id from class_subject_mapping csm 
                        inner join instructor i on i.instructor_id = csm.instructor_id
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
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                group.setId(rs.getString("class_id"));
                group.setClass_name(rs.getString("class_name"));
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
    
    public List<GroupSubjectMapping> getAllClass() {
    List<GroupSubjectMapping> listGSM = new ArrayList<>();
    String sql = """
                    SELECT csm_id, i.instructor_name, i.instructor_id, c.class_name, c.class_id, c.link_url, su.subject_name, su.subject_id
                    FROM class_subject_mapping csm 
                    INNER JOIN instructor i ON i.instructor_id = csm.instructor_id
                    INNER JOIN class c ON c.class_id = csm.class_id
                    INNER JOIN subject su ON su.subject_id = csm.subject_id
                    ORDER BY c.class_name
                 """;
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String id = rs.getString("csm_id");
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

            GroupSubjectMapping gsm = new GroupSubjectMapping(id, instructor, group, subject);

            listGSM.add(gsm);
        }
        return listGSM;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}

    
    public boolean checkSubjectExist(String class_id, String subject_id) {
    String sql = "SELECT * FROM swp391_g4_ver1.class_subject_mapping WHERE class_id = ? AND subject_id = ?";
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
    
    public static void main(String[] args) {
//        // Assuming you have a database connection named "connection" available
        GSMDBContext gsm = new GSMDBContext();
//        GroupSubjectMapping result = gsm.getClassNewset();
//        
//        // Print the retrieved data
//        System.out.println(result.getId());
//        System.out.println("Instructor: " + result.getInstructor().getName());
//        System.out.println("Class: " + result.getGroup().getClass_name());
//        System.out.println("Class: " + result.getGroup().getId());
//        System.out.println("Subject: " + result.getSubject().getName());
        boolean gsmCheck = gsm.checkSubjectExist("15", "2");
        System.out.println(gsmCheck);
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
