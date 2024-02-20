/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author anhye
 */
public class GroupDBContext extends DBContext<Group> {
    public void insertClass(String name, String link_url){
        String sql = "INSERT INTO Class (class_name, link_url) VALUES (?, ?);";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,  name);
            ps.setString(2,  link_url);
            
            ps.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public List<Group> getAllClass() throws SQLException{
        List<Group> list = new ArrayList<>();
        String sql = "SELECT * FROM swp391_g4_ver1.class;";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Group(rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3)));
            }        
        }catch (SQLException e){
            System.out.println(e);
        }     
        return list;    
    }

    

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
