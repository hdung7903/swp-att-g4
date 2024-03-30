
package dal;

import entity.Feedback;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class FeedbackDBContext extends DBContext<Feedback> {

    @Override
    public ArrayList<Feedback> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Feedback entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Feedback entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Feedback entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Feedback get(Feedback entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Feedback> checkFeedBackExist(String csm_id, String student_id) {
        String sql = """
                     SELECT fb.fb_id, fb.student_id, s.student_name, fb.csm_id, fb.punctuality, fb.fully_syllabus, fb.intructor_skills, fb.instructor_support, fb.comment
                     FROM feed_back fb 
                     INNER JOIN class_subject_mapping csm ON csm.csm_id = fb.csm_id
                     INNER JOIN student s ON s.student_id = fb.student_id
                     WHERE csm.csm_id = ? and s.student_id = ?""";
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, csm_id);
            ps.setString(2, student_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student stu = new Student();
                stu.setName(rs.getString("student_name"));
                Feedback fb = new Feedback();
                fb.setStudent(stu);
                fb.setId(rs.getInt("fb_id"));
                fb.setPunctuality(rs.getInt("punctuality"));
                fb.setFully_syllabus(rs.getInt("fully_syllabus"));
                fb.setIntructor_skills(rs.getInt("intructor_skills"));
                fb.setInstructor_support(rs.getInt("instructor_support"));
                fb.setComment(rs.getString("comment"));
                feedbackList.add(fb);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    public void addFeedback(Feedback fb) {
        try {
            String sql = "INSERT INTO feed_back (student_id, csm_id, punctuality, fully_syllabus, intructor_skills, instructor_support, comment) VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fb.getStudent().getId());
            stm.setInt(2, fb.getGsm().getId());
            stm.setInt(3, fb.getPunctuality());
            stm.setInt(4, fb.getFully_syllabus());
            stm.setInt(5, fb.getIntructor_skills());
            stm.setInt(6, fb.getInstructor_support());
            stm.setString(7, fb.getComment());

            stm.executeUpdate();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    public void editFeedback(Feedback fb) {
        try {
            String sql = """
                         UPDATE feed_back 
                         SET 
                             student_id = ?, 
                             csm_id = ?, 
                             punctuality = ?, 
                             fully_syllabus = ?, 
                             intructor_skills = ?,
                             instructor_support = ?, 
                             comment = ?
                         WHERE fb_id = ?;""";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fb.getStudent().getId());
            stm.setInt(2, fb.getGsm().getId());
            stm.setInt(3, fb.getPunctuality());
            stm.setInt(4, fb.getFully_syllabus());
            stm.setInt(5, fb.getIntructor_skills());
            stm.setInt(6, fb.getInstructor_support());
            stm.setString(7, fb.getComment());
            stm.setInt(8, fb.getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    
    public static void main(String[] args) {
        FeedbackDBContext fb = new FeedbackDBContext();
        ArrayList<Feedback> list = fb.checkFeedBackExist("17", "1");
        System.out.println(list);
    }
}