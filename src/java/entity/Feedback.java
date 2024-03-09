/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class Feedback extends BaseEntity {
    private int id;
    private Student student;
    private GroupSubjectMapping gsm;
    private int punctuality;
    private int fully_syllabus;
    private int  intructor_skills;
    private int instructor_support;
    private String comment;

    public Feedback() {
    }

    public Feedback(int id, Student student, GroupSubjectMapping gsm, int punctuality, int fully_syllabus, int intructor_skills, int instructor_support, String comment) {
        this.id = id;
        this.student = student;
        this.gsm = gsm;
        this.punctuality = punctuality;
        this.fully_syllabus = fully_syllabus;
        this.intructor_skills = intructor_skills;
        this.instructor_support = instructor_support;
        this.comment = comment;
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

    public GroupSubjectMapping getGsm() {
        return gsm;
    }

    public void setGsm(GroupSubjectMapping gsm) {
        this.gsm = gsm;
    }

    public int getPunctuality() {
        return punctuality;
    }

    public void setPunctuality(int punctuality) {
        this.punctuality = punctuality;
    }

    public int getFully_syllabus() {
        return fully_syllabus;
    }

    public void setFully_syllabus(int fully_syllabus) {
        this.fully_syllabus = fully_syllabus;
    }

    public int getIntructor_skills() {
        return intructor_skills;
    }

    public void setIntructor_skills(int intructor_skills) {
        this.intructor_skills = intructor_skills;
    }

    public int getInstructor_support() {
        return instructor_support;
    }

    public void setInstructor_support(int instructor_support) {
        this.instructor_support = instructor_support;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
