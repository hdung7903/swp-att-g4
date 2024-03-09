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

    public ArrayList<Account> getIntructorByUserName(String username) {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "Select i.instructor_id, a.username, a.password, a.role_id, i.instructor_name, i.email, \n"
                    + "i.dob, i.gender\n"
                    + "from account a\n"
                    + "inner join instructor i on i.username = a.username\n"
                    + "where a.username = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setRole_id(rs.getInt("role_id"));
                Instructor instructor = new Instructor();
                instructor.setId(rs.getString("instructor_id"));
                instructor.setName(rs.getString("instructor_name"));
                instructor.setEmail(rs.getString("email"));
                instructor.setDob(rs.getDate("dob"));
                instructor.setGender(rs.getBoolean("gender"));
                account.setInstructor(instructor);
                list.add(account);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public ArrayList<Account> getStudentByUserName(String username) {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "Select  stu.student_id, a.username, a.password, a.role_id, stu.student_name, stu.email, \n"
                    + "stu.dob, stu.gender\n"
                    + "from account a\n"
                    + "inner join student stu on stu.username = a.username\n"
                    + "where a.username = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setRole_id(rs.getInt("role_id"));
                Student student = new Student();
                student.setId(rs.getString("instructor_id"));
                student.setName(rs.getString("instructor_name"));
                student.setEmail(rs.getString("email"));
                student.setDob(rs.getDate("dob"));
                student.setGender(rs.getBoolean("gender"));
                account.setStudent(student);
                list.add(account);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public Account getAcountByUsername(String username) {
        String sql = "Select * from Account where username = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
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

    public boolean editInformation(String id, String username, String password, int role_id, String fullName, String email, String dob, int gender) {
        boolean success = false;
        String sql1 = "UPDATE account SET password = ?, role_id = ?, email = ? WHERE username = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, password);
            st1.setInt(2, role_id);
            st1.setString(3, email);
            st1.setString(4, username);
            int rowCount1 = st1.executeUpdate();
            if (rowCount1 > 0) {
                String sql2 = "";
                if (role_id == 3) {
                    sql2 = "UPDATE instructor SET instructor_id = ?, instructor_name = ?, email = ?, dob = ?, gender = ? WHERE username = ?";
                } else if (role_id == 4) {
                    sql2 = "UPDATE student SET student_id = ?, student_name = ?, email = ?, dob = ?, gender = ? WHERE username = ?";
                }
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, id);
                st2.setString(2, fullName);
                st2.setString(3, email);
                st2.setString(4, dob);
                st2.setInt(5, gender);
                st2.setString(6, username);
                int rowCount2 = st2.executeUpdate();
                success = rowCount2 > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return success;
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
