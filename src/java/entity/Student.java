/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author leduy
 */
public class Student extends BaseEntity {

    private String id;
    private String name;
    private String username;
    private String email;
    private Date dob;
    private boolean gender;
    private boolean isDeleted;
    private ArrayList<Session> sessions = new ArrayList<>();
    private List<Boolean> status = new ArrayList<>();
    private List<Boolean> attendances;

    public Student() {
    }

    public Student(String id, String name, String username, String email, Date dob, boolean gender, boolean isDeleted, List<Boolean> attendances) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.isDeleted = isDeleted;
        this.attendances = attendances;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public List<Boolean> getStatus() {
        return status;
    }

    public void setStatus(List<Boolean> status) {
        this.status = status;
    }

    public List<Boolean> getAttendances() {
        return attendances;
    }

    public void setAttendances(List<Boolean> attendances) {
        this.attendances = attendances;
    }

}
