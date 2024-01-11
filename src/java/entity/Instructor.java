/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author leduy
 */
public class Instructor extends BaseEntity {
    private int instructor_id;
    private String instructor_name;
    private String username;
    private String email;
    private Date dob;
    private boolean gender;
    private boolean isDeleted;

    public Instructor() {
    }

    public Instructor(int instructor_id, String instructor_name, String username, String email, Date dob, boolean gender, boolean isDeleted) {
        this.instructor_id = instructor_id;
        this.instructor_name = instructor_name;
        this.username = username;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.isDeleted = isDeleted;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(int instructor_id) {
        this.instructor_id = instructor_id;
    }

    public String getInstructor_name() {
        return instructor_name;
    }

    public void setInstructor_name(String instructor_name) {
        this.instructor_name = instructor_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
    
}
