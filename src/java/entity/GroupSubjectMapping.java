/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class GroupSubjectMapping extends BaseEntity {
    private int gsm_id;
    private String group_id;
    private String subject_id;
    private int total_slots;
    private String ins_id;
    private int session_id;
    private ArrayList<Session> sessions = new ArrayList<>();

    public GroupSubjectMapping() {
    }

    public GroupSubjectMapping(int csm_id, String group_id, String subject_id, int total_slots, String ins_id, int session_id) {
        this.gsm_id = gsm_id;
        this.group_id = group_id;
        this.subject_id = subject_id;
        this.total_slots = total_slots;
        this.ins_id = ins_id;
        this.session_id = session_id;
    }

    public int getGsm_id() {
        return gsm_id;
    }

    public void setGsm_id(int gsm_id) {
        this.gsm_id = gsm_id;
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }

    public String getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }

    public int getTotal_slots() {
        return total_slots;
    }

    public void setTotal_slots(int total_slots) {
        this.total_slots = total_slots;
    }

    public String getIns_id() {
        return ins_id;
    }

    public void setIns_id(String ins_id) {
        this.ins_id = ins_id;
    }

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

   
    
}
