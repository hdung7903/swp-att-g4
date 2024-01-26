/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import dal.DBContext;
import entity.Instructor;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class AccountDBContext extends DBContext<Account>{
    
    public Account ValidateAccount(String userName, String passWord) {
        String sql = "Select * from Account where username = ? and password = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, passWord);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                acc = new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id")
                        );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }
    
    public Account getAccountIdByUsername(String username) {
        String sql = "SELECT s.student_id, i.instructor_id FROM Account acc "
                + "LEFT JOIN Student s ON s.username = acc.username "
                + "LEFT JOIN Instructor i ON i.username = acc.username "
                + "WHERE acc.username=?";
        Account acc = null;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();  
            while(rs.next()){
                acc = new Account(
                        rs.getString("student_id"),
                        rs.getString("instructor_id")
                );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e); // Handle exceptions appropriately in a real application
        }
        return acc;    
    }
    
    public static void main(String[] args) {
        AccountDBContext da = new AccountDBContext();
        System.out.println(da.ValidateAccount("admin", "123"));
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
