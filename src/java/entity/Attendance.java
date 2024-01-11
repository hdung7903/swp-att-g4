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
public class Attendance extends BaseEntity {
    private int att_id;
    private String student_id;
    private int session_id;
    private boolean status;
    private Date att_datetime;
    private String att_description;
    private ArrayList<Session> sessions = new ArrayList<>();

    public Attendance() {
    }

    public Attendance(int att_id, String student_id, int session_id, boolean status, Date att_datetime, String att_description) {
        this.att_id = att_id;
        this.student_id = student_id;
        this.session_id = session_id;
        this.status = status;
        this.att_datetime = att_datetime;
        this.att_description = att_description;
    }    

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

    public int getAtt_id() {
        return att_id;
    }

    public void setAtt_id(int att_id) {
        this.att_id = att_id;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getAtt_datetime() {
        return att_datetime;
    }

    public void setAtt_datetime(Date att_datetime) {
        this.att_datetime = att_datetime;
    }

    public String getAtt_description() {
        return att_description;
    }

    public void setAtt_description(String att_description) {
        this.att_description = att_description;
    }
    
}
