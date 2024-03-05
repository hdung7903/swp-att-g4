/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Application;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UpdateStatusDBContext extends DBContext<Application>{

    public void updateIsSend(int appId) {
        try {
            String sql = "UPDATE application SET isSend = 1 WHERE app_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, appId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    
    }
    
    public void updateIsApprove(int appId, boolean isApprove, String comment, boolean isSend ) {
        try {
            String sql = "UPDATE application SET isApprove = ?, comment = ?, isSend = ? WHERE app_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, isApprove);
            stm.setString(2, comment);
            stm.setBoolean(3, isSend);
            stm.setInt(4, appId);
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    
    @Override
    public ArrayList<Application> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Application get(Application entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
