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

    public void deleteSubjectAssignment(String instructorId, List<String> subjectIds) throws SQLException {
        String sql = "DELETE FROM subject_instructor_mapping WHERE instructor_id = ? AND subject_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            for (String subjectId : subjectIds) {
                stm.setString(1, instructorId);
                stm.setString(2, subjectId);
                stm.addBatch();
            }
            stm.executeBatch();
        }
    }

    public List<SubjectInstructorMapping> getAllInstructorbySubject(String subject_id) throws SQLException {
        List<SubjectInstructorMapping> list = new ArrayList<>();
        String sql = "SELECT sim_id, i.instructor_name, i.instructor_id, s.subject_name, s.subject_id\n"
                + "                 FROM subject_instructor_mapping sim\n"
                + "                 INNER JOIN instructor i ON i.instructor_id = sim.instructor_id\n"
                + "                 INNER JOIN subject s ON s.subject_id = sim.subject_id\n"
                + "                 WHERE sim.subject_id = ?;";
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
}
