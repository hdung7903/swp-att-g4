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
    public String username, password;
    public int role_id;
    public Instructor instructor;
    public String code;
    public Student student;
    public String email;

    public Account() {
    }

    public Account(String username, String password, int role_id, String email) {
        this.username = username;
        this.password = password;
        this.role_id = role_id;
        this.email = email;
    }

    public Account(int role_id, String username, String password, Instructor instructor, Student student) {
        this.role_id = role_id;
        this.username = username;
        this.password = password;
        this.instructor = instructor;
        this.student = student;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
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

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", role_id=" + role_id + ", instructor=" + instructor + ", code=" + code + ", student=" + student + ", email=" + email + '}';
    }

}