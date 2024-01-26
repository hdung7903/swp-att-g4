/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HP
 */
public class Account extends BaseEntity{
    public String username, password, student_id, instructor_id;
    public int role_id;
    public Instructor instructor;

    public Account() {
    }

    public Account(Instructor instructor) {
        this.instructor = instructor;
    }

    public Account(String username, String password, int role_id) {
        this.username = username;
        this.password = password;
        this.role_id = role_id;
    }

    public Account(String student_id, String instructor_id) {
        this.student_id = student_id;
        this.instructor_id = instructor_id;
    }

    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(String instructor_id) {
        this.instructor_id = instructor_id;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", student_id=" + student_id + ", instructor_id=" + instructor_id + ", role_id=" + role_id + ", instructor=" + instructor + '}';
    }
    
    
}