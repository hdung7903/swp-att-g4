/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author leduy
 */
public class Session extends BaseEntity {

    private int id;
    private int index;
    private Date date;
    private Group group;
    private boolean isAtt;
    private Instructor instructor;
    private Student student;
    private Attendance attendance;
    private GroupSubjectMapping gsm;
    private Subject subject;
    private TimeSlot time;
    private ArrayList<Attendance> atts= new ArrayList<>(); 

    public Session() {
    }

    public Session(int id, int index, Date date, Group group, boolean isAtt, Instructor instructor, Student student, Attendance attendance, GroupSubjectMapping gsm, Subject subject, TimeSlot time) {
        this.id = id;
        this.index = index;
        this.date = date;
        this.group = group;
        this.isAtt = isAtt;
        this.instructor = instructor;
        this.student = student;
        this.attendance = attendance;
        this.gsm = gsm;
        this.subject = subject;
        this.time = time;
    }    

    public TimeSlot getTime() {
        return time;
    }

    public void setTime(TimeSlot time) {
        this.time = time;
    }

    public ArrayList<Attendance> getAtts() {
        return atts;
    }

    public void setAtts(ArrayList<Attendance> atts) {
        this.atts = atts;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public boolean isIsAtt() {
        return isAtt;
    }

    public void setIsAtt(boolean isAtt) {
        this.isAtt = isAtt;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Attendance getAttendance() {
        return attendance;
    }

    public void setAttendance(Attendance attendance) {
        this.attendance = attendance;
    }

    public GroupSubjectMapping getGsm() {
        return gsm;
    }

    public void setGsm(GroupSubjectMapping gsm) {
        this.gsm = gsm;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    

    
    


}
