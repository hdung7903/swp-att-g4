/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class StudentDBContext extends DBContext<Student> {
    
    public List<Student> getAllStudent() throws SQLException{
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM student;";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Student(rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4)));
            }        
        }catch (SQLException e){
            System.out.println(e);
        }     
        return list;    
    }
    
    public ArrayList<Student> getStudentbyStaff(String txtSearch) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT student_id, student_name, email\n"
                    + "FROM student ";
            if (txtSearch != null && !txtSearch.equals("")) {
                sql += "WHERE CONCAT(student_id, student_name, email) LIKE ?";
            }
            sql += " GROUP BY student_id, student_name, email;";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (txtSearch != null && !txtSearch.equals("")) {
                stm.setString(1, "%" + txtSearch + "%");
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("student_id"));
                student.setName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                students.add(student);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
