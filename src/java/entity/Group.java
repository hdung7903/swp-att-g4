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
public class Group extends BaseEntity {
    private String id;
    private String class_name;
    private String link_url;
    private ArrayList<Session> sessions = new ArrayList<>();
    private GroupSubjectMapping gsm;
    private Subject subject;

    public Group() {
    }

    public Group(String id, String class_name, String link_url) {
        this.id = id;
        this.class_name = class_name;
        this.link_url = link_url;
    }

    public Group(String class_name, String link_url) {
        this.class_name = class_name;
        this.link_url = link_url;
    }

    public Group(String id, String class_name, String link_url, GroupSubjectMapping gsm, Subject subject) {
        this.id = id;
        this.class_name = class_name;
        this.link_url = link_url;
        this.gsm = gsm;
        this.subject = subject;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getLink_url() {
        return link_url;
    }

    public void setLink_url(String link_url) {
        this.link_url = link_url;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
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
