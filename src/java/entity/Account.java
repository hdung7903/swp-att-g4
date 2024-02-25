/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class Account extends BaseEntity {
    public int role_id;
    private String username;
    private String fullname;
    private String password;
    private String email;
    private String roleName;
    private Instructor instructor;
    private Student student;

    public Account() {
    }

    public Account(int role_id, String username, String password, String email, Instructor instructor, Student student) {
        this.role_id = role_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.instructor = instructor;
        this.student = student;
    }

    public Account(String username, String fullname, String password, String email, int role_id) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role_id = role_id;
    }
    
    
    public Account( String username, String password,int role_id, String email) {       
        this.username = username;
        this.password = password;
        this.email = email;
        this.role_id = role_id;
    }
    
    public Account( String username, String password, int role_id) {       
        this.username = username;
        this.password = password;
        this.role_id = role_id;
    }
    
    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }


    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Account(String username, String password, String roleName) {
        this.username = username;
        this.password = password;
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", roleName=" + roleName + '}';
    }
    
}
