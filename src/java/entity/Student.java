package entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private Instructor instructor;
    private Subject subject;
    private List<Date> sesDate = new ArrayList<>();

    public Student() {
    }

    public Student(String id, String name, String username, String email, Date dob, boolean gender, boolean isDeleted, List<Boolean> attendances, Instructor instructor, Subject subject) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.isDeleted = isDeleted;
        this.attendances = attendances;
        this.instructor = instructor;
        this.subject = subject;
    }

    public Student(String id, String name, String username, String email) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
    }

    public Student(String id) {
        this.id = id;
    }

    public Student(String name, Instructor instructor, Subject subject, String email, List<Boolean> attendances) {
        this.name = name;
        this.email = email;
        this.instructor = instructor;
        this.subject = subject;
        this.attendances = attendances;
    }

    public Student(String name, Instructor instructor, Subject subject, List<Date> sesDate, List<Boolean> attendances) {
        this.name = name;
        this.sesDate = sesDate;
        this.instructor = instructor;
        this.subject = subject;
        this.attendances = attendances;
    }

    public Student(String id, String name, String username, String email, Date dob, boolean gender) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
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

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public List<Date> getSesDate() {
        return sesDate;
    }

    public void setSesDate(List<Date> sesDate) {
        this.sesDate = sesDate;
    }

}
