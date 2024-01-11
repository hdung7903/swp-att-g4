/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class ClassSubjectMapping extends BaseEntity {
    private int csm_id;
    private String class_id;
    private String subject_id;
    private int total_slots;
    private String ins_id;
    private int session_id;

    public ClassSubjectMapping() {
    }

    public ClassSubjectMapping(int csm_id, String class_id, String subject_id, int total_slots, String ins_id, int session_id) {
        this.csm_id = csm_id;
        this.class_id = class_id;
        this.subject_id = subject_id;
        this.total_slots = total_slots;
        this.ins_id = ins_id;
        this.session_id = session_id;
    }

    public int getCsm_id() {
        return csm_id;
    }

    public void setCsm_id(int csm_id) {
        this.csm_id = csm_id;
    }

    public String getClass_id() {
        return class_id;
    }

    public void setClass_id(String class_id) {
        this.class_id = class_id;
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
    
}
