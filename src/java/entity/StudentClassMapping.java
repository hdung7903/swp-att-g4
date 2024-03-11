/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class StudentClassMapping extends BaseEntity {
    private int id;
    private Student student;
    private Group group;
    private Subject subject;
    private GroupSubjectMapping gsm;
    private Instructor instructor;

    public StudentClassMapping() {
    }

    public StudentClassMapping(int id, Student student, Group group) {
        this.id = id;
        this.student = student;
        this.group = group;
    }

    public StudentClassMapping(int id, Student student, Group group, Subject subject, GroupSubjectMapping gsm, Instructor instructor) {
        this.id = id;
        this.student = student;
        this.group = group;
        this.subject = subject;
        this.gsm = gsm;
        this.instructor = instructor;
    } 

    public StudentClassMapping(int id) {
        this.id = id;
    }
       

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
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

    public GroupSubjectMapping getGsm() {
        return gsm;
    }

    public void setGsm(GroupSubjectMapping gsm) {
        this.gsm = gsm;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    
    
}
