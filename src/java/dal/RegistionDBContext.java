/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Registion;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class RegistionDBContext extends DBContext<Registion>{
    
    public void enrollClass(Registion enroll) {
        try {
           
            String sql = "INSERT INTO registion (class_id, student_id) "
                       + "VALUES (?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, enroll.getGroup().getId()); 
            stm.setString(2, enroll.getStudent().getId()); 
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(RegistionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(RegistionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    
    public Registion checkStudentExist(String class_id, String student_id) {
        String sql = "SELECT * FROM registion\n"
                + "Where class_id = ? and student_id= ?;";
        Registion list = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, class_id);
            stm.setString(2, student_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list = new Registion(
                        rs.getInt("regis_id")
                );
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SCMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Registion> getAllRegistion() {
    List<Registion> listRes = new ArrayList<>();
    String sql = "SELECT regis_id, c.class_name, c.class_id, s.student_name, s.student_id\n" +
"                   FROM registion res\n" +
"                   INNER JOIN class c ON c.class_id = res.class_id\n" +
"                   INNER JOIN student s ON s.student_id = res.student_id\n" +
"                   order by res.class_id;";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Registion res = new Registion();
            Group group = new Group();
            Student student = new Student();
            
            int id =Integer.parseInt( rs.getString("regis_id"));
            group.setId(rs.getString("class_id"));
            group.setName(rs.getString("class_name"));
            student.setId(rs.getString("student_id"));
            student.setName(rs.getString("student_name"));
            
           res.setId(id);
           res.setGroup(group);
           res.setStudent(student);

            listRes.add(res);
        }
        return listRes;
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
    }
    
    public void deleteRes(String regis_id) {
        try {
            String sql = "DELETE FROM registion WHERE regis_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, regis_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    

    @Override
    public ArrayList<Registion> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Registion get(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}