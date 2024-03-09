/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Administrator
 */
public class SubjectInstructorMapping extends BaseEntity  {
    private int sim_id;
    private Subject subject;
    private Instructor instructor;

    public SubjectInstructorMapping() {
    }

    public SubjectInstructorMapping(int sim_id, Subject subject, Instructor instructor) {
        this.sim_id = sim_id;
        this.subject = subject;
        this.instructor = instructor;
    }

    public int getSim_id() {
        return sim_id;
    }

    public void setSim_id(int sim_id) {
        this.sim_id = sim_id;
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

    @Override
    public String toString() {
        return "SubjectInstructorMapping{" + "sim_id=" + sim_id + ", subject=" + subject + ", instructor=" + instructor + '}';
    }

}
