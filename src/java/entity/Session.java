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
public class Session extends BaseEntity {

    private int session_id;
    private int session_index;
    private Date session_date;
    private String group_id;
    private boolean isAtt;
    private Instructor instructor;
    private Student student;
    private Attendance attendance;
    private Group group;
    private GroupSubjectMapping gsm;
    private Subject subject;

    public Session() {
    }

    public Session(int session_id, int session_index, Date session_date, String group_id, boolean isAtt, Instructor instructor, Student student, Attendance attendance, Group group, GroupSubjectMapping gsm, Subject subject) {
        this.session_id = session_id;
        this.session_index = session_index;
        this.session_date = session_date;
        this.group_id = group_id;
        this.isAtt = isAtt;
        this.instructor = instructor;
        this.student = student;
        this.attendance = attendance;
        this.group = group;
        this.gsm = gsm;
        this.subject = subject;
    }

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
    }

    public int getSession_index() {
        return session_index;
    }

    public void setSession_index(int session_index) {
        this.session_index = session_index;
    }

    public Date getSession_date() {
        return session_date;
    }

    public void setSession_date(Date session_date) {
        this.session_date = session_date;
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
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

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
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
