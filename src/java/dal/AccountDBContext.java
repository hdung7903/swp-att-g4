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
import java.util.Vector;

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

    public Account ValidateAccountByEmail(String email) {
        String sql = "Select * from Account where email = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                acc = new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id"),
                        rs.getString("email")
                );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }
    
     public Account ValidateAccountByEmailAndUsername(String userName, String email) {
        String sql = "Select * from Account where username = ? and email = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                acc = new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id"),
                        rs.getString("email")
                        );
                return acc;
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
            String sql = "Select i.instructor_id,i.instructor_name,i.username,i.email,i.dob,i.gender \n"
                    + "from account a\n"
                    + "Join instructor i on i.username = a.username \n"
                    + "where a.username = ?";
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
            String sql = "Select s.student_id,s.student_name,s.username,s.email,s.dob,s.gender from Account a\n"
                    + "join Student s On s.username = a.username\n"
                    + "join Role r ON r.role_id = a.role_id \n"
                    + "where a.username =?";
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

    public Vector<Student> getAllStudent(String txtSearch, boolean isDeletedRule) {
        Vector<Student> list = new Vector<>();
        try {
            String sql = "SELECT * FROM Account A\n"
                    + "JOIN Student S ON S.username = A.username\n"
                    + "WHERE 1=1\n";
            if (isDeletedRule) {
                sql += " AND S.isDeleted = 1";
            } else {
                sql += " AND S.isDeleted = 0";
            }
            if (txtSearch != null && !txtSearch.equals("")) {
                sql += " AND CONCAT(S.username, S.student_name, S.email) LIKE '%" + txtSearch + "%'";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Student(
                        rs.getString("student_id"),
                        rs.getString("student_name"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender")
                ));

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Vector<Instructor> getAllInstructor(String txtSearch, boolean isDeletedRule) {
        Vector<Instructor> list = new Vector<>();
        try {
            String sql = "Select * from account A\n"
                    + "Join instructor I on I.username = A.username where 1=1\n";
            if (isDeletedRule) {
                sql += " AND I.isDeleted = 1";
            } else {
                sql += " AND I.isDeleted = 0";
            }
            if (txtSearch != null && !txtSearch.equals("")) {
                sql += " AND CONCAT(I.username, I.instructor_name, I.email) LIKE '%" + txtSearch + "%'";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Instructor(
                        rs.getString("instructor_id"),
                        rs.getString("instructor_name"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Vector<Account> getAllManage(String txtSearch, int role, boolean isDeletedRule) {
        Vector<Account> list = new Vector<>();
        try {
            String sql = "Select * from Account A\n";
            if (isDeletedRule) {
                sql += " where 1=0";
            } else {
                sql += " where 1=1";
            }
            if (role == 0) {
                sql += " and A.role_id in (1, 2)";
            } else {
                sql += " and A.role_id in (" + role + ")";
            }

            if (txtSearch != null && !txtSearch.equals("")) {
                sql += " AND A.username LIKE '%" + txtSearch + "%'";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean insertAccount(String id,
            String username, String password,
            int role_id, String fullName, String email, String dob, int gender) {
        try {
            String sql1 = "INSERT INTO account\n"
                    + "(username, password, role_id, email)\n"
                    + "VALUES (?, ?, ?, ?);";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, username);
            st1.setString(2, password);
            st1.setInt(3, role_id);
            st1.setString(4, email);
            int rs = st1.executeUpdate();
            if (rs > 0) {
                String sql2 = "";
                if (role_id == 3) {
                    sql2 = "INSERT INTO instructor\n"
                            + "(instructor_id,\n"
                            + "instructor_name,\n"
                            + "username,\n"
                            + "email,\n"
                            + "dob,\n"
                            + "gender,\n"
                            + "isDeleted)\n"
                            + "VALUES\n"
                            + "(?,?,?,?,?,?,?);";
                } else if (role_id == 4) {
                    sql2 = "INSERT INTO student\n"
                            + "(student_id,\n"
                            + "student_name,\n"
                            + "username,\n"
                            + "email,\n"
                            + "dob,\n"
                            + "gender,\n"
                            + "isDeleted)\n"
                            + "VALUES\n"
                            + "(?,?,?,?,?,?,?);";
                }
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, id);
                st2.setString(2, fullName);
                st2.setString(3, username);
                st2.setString(4, email);
                st2.setString(5, dob);
                st2.setInt(6, gender);
                st2.setInt(7, 0);
                return st2.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean deleteAccount(String username) {
        try {
            String table = "Account";
            if (getAcountByUsername(username).getRole_id() == 3) {
                table = "instructor";
            } else if (getAcountByUsername(username).getRole_id() == 4) {
                table = "student";
            }

            String sql1 = "DELETE FROM " + table + " WHERE username like '" + username + "'";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            int rs1 = stm1.executeUpdate();
            System.out.println("s1 " + rs1);
            if (rs1 > 0) {

                String sql2 = "DELETE FROM account WHERE username like '" + username + "'";
                PreparedStatement stm2 = connection.prepareStatement(sql2);
                return stm2.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean deleteRuleAccount(String username) {
        try {
            String table = "account";
            switch (getAcountByUsername(username).getRole_id()) {
                case 3:
                    table = "instructor";
                    break;
                case 4:
                    table = "student";
                    break;
                default:
                    return false;
            }
            String sql1 = "UPDATE " + table + " SET isDeleted = 1\n"
                    + "WHERE `username` like '" + username + "'";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            return stm1.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
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

    public boolean restoreAccount(String username) {
        try {
            String table = "account";
            switch (getAcountByUsername(username).getRole_id()) {
                case 3:
                    table = "instructor";
                    break;
                case 4:
                    table = "student";
                    break;
                default:
                    return false;
            }
            String sql1 = "UPDATE " + table + " SET isDeleted = 0\n"
                    + "WHERE `username` like '" + username + "'";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            return stm1.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public Vector<Account> getResultSet() {
        Vector<Account> list = new Vector<>();
        String sql = "SELECT \n"
                + "    a.username,\n"
                + "    a.password,\n"
                + "    r.role_name\n"
                + "FROM \n"
                + "    account a\n"
                + "INNER JOIN \n"
                + "    role r ON a.role_id = r.role_id\n"
                + "LEFT JOIN \n"
                + "    Student s ON a.role_id = 4 AND a.role_id = s.username\n"
                + "LEFT JOIN \n"
                + "    Instructor i ON a.role_id = 3 AND a.role_id = i.username";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role_name")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
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
