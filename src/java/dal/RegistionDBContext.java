/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Registion;
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
                        rs.getInt("rs_id")
                );
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SCMDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
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
