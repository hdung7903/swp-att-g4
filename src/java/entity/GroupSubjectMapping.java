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
    private int id;
    private Group group;
    private Subject subject;
    private int total_slots;
    private Instructor instructor;
    private Session session;
    private ArrayList<Session> sessions = new ArrayList<>();

    public GroupSubjectMapping() {
    }

    public GroupSubjectMapping(int id, Group group, Subject subject, int total_slots, Instructor instructor, Session session) {
        this.id = id;
        this.group = group;
        this.subject = subject;
        this.total_slots = total_slots;
        this.instructor = instructor;
        this.session = session;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }
    
    
    

    public int getTotal_slots() {
        return total_slots;
    }

    public void setTotal_slots(int total_slots) {
        this.total_slots = total_slots;
    }
 
}
