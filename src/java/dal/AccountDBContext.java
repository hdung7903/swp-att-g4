/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Instructor;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class AccountDBContext extends DBContext<Account> {

    public Account ValidateAccount(String username, String password) {
        String sql = "Select * from Account where username = ? and password = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setRole_id(rs.getInt("role_id"));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }

    public boolean resetPassword(String email, String username, String newPassword) {
        boolean success = false;
        String sql = "UPDATE `swp`.`account`\n"
                + "SET `password` = ?\n"
                + "WHERE `email` = ?"
                + "AND `username`=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            st.setString(3, username);
            int rowCount = st.executeUpdate();
            success = rowCount > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return success;
    }

    public Account getAccountIdByUsername(String username) {
        String sql = "SELECT s.student_id, i.instructor_id,s.email as student_email,i.email as instructor_email\n"
                + "FROM Account acc \n"
                + "LEFT JOIN Student s ON s.username = acc.username \n"
                + "LEFT JOIN Instructor i ON i.username = acc.username \n"
                + "WHERE acc.username= ?";
        Account acc = new Account();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("student_id") != null) {
                    Student student = new Student();
                    student.setId(rs.getString("student_id"));
                    student.setEmail(rs.getString("student_email"));
                    acc.setStudent(student);
                }

                if (rs.getString("instructor_id") != null) {
                    Instructor instructor = new Instructor();
                    instructor.setId(rs.getString("instructor_id"));
                    instructor.setEmail(rs.getString("instructor_email"));
                    acc.setInstructor(instructor);
                }

                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Instructor getIntructorByUserName(String username) {
        Instructor ins = null;
        try {
            String sql = "Select * from account A\n"
                    + "Join instructor I on I.username = A.username where A.username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ins = new Instructor(
                        rs.getString("instructor_id"),
                        rs.getString("instructor_name"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender")
                );

                return ins;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return ins;
    }

    public Student getStudentByUserName(String username) {
        Student stu = null;
        try {
            String sql = "Select * from Account A\n"
                    + "join Student S On S.username = A.username\n"
                    + "join Role R ON R.role_id = A.role_id where A.username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                stu = new Student(
                        rs.getString("student_id"),
                        rs.getString("student_name"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender")
                );

                return stu;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return stu;
    }

    public boolean changePassword(String username, String newPassword) {
        String sql = "UPDATE `swp`.`account`\n"
                + "SET `password` = ?\n"
                + "WHERE `username` = ?";
        int haveChange = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, username);
            haveChange = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return haveChange > 0;
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
