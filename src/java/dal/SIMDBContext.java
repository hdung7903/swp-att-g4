package dal;

import entity.Subject;
import entity.SubjectInstructorMapping;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leduy
 */
public class SIMDBContext extends DBContext<SubjectInstructorMapping> {

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

    public void insertSubjectAssignment(String instructorId, List<String> subjectIds) {
        try {
            String sql = "INSERT INTO subject_instructor_mapping (instructor_id, subject_id) VALUES (?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            for (String subjectId : subjectIds) {
                stm.setString(1, instructorId);
                stm.setString(2, subjectId);
                stm.addBatch();
            }

            stm.executeBatch();
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }
}
