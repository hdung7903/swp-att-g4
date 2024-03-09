/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Instructor;
import entity.Subject;
import entity.SubjectInstructorMapping;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class SIMDBContext extends DBContext<SubjectInstructorMapping>{
    
    public List<SubjectInstructorMapping> getAllInstructorbySubject(String subject_id) throws SQLException {
    List<SubjectInstructorMapping> list = new ArrayList<>();
    String sql = """
                 SELECT sim_id, i.instructor_name, i.instructor_id, s.subject_name, s.subject_id
                 FROM subject_instructor_mapping sim
                 INNER JOIN instructor i ON i.instructor_id = sim.instructor_id
                 INNER JOIN subject s ON s.subject_id = sim.subject_id
                 WHERE sim.subject_id = ?;
                 """;
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, subject_id); // Use the parameter value instead of the string "subject_id"
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("sim_id");
            String instructorId = rs.getString("instructor_id");
            String instructorName = rs.getString("instructor_name");
            String subjectId = rs.getString("subject_id");
            String subjectName = rs.getString("subject_name");

            Instructor instructor = new Instructor(instructorId, instructorName);
            Subject subject = new Subject(subjectId, subjectName);

            SubjectInstructorMapping sim = new SubjectInstructorMapping(id, subject, instructor);

            list.add(sim);
        }
        return list;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}

        
    public static void main(String[] args) throws SQLException {
        SIMDBContext simDB = new SIMDBContext();
        List<SubjectInstructorMapping> result = simDB.getAllInstructorbySubject("1");
        
        // In kết quả
        for (SubjectInstructorMapping sim : result) {
            System.out.println("Instructor Name: " + sim.getInstructor().getName());
        }
    }

    @Override
    public ArrayList<SubjectInstructorMapping> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(SubjectInstructorMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(SubjectInstructorMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SubjectInstructorMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SubjectInstructorMapping get(SubjectInstructorMapping entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
