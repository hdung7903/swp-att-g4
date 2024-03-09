/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class RegistrationClass extends BaseEntity{
    private Group group;
    private Student student;
    private ArrayList<RegistrationClass> newEnroll = new ArrayList<>();

    public RegistrationClass(Group group, Student student) {
        this.group = group;
        this.student = student;
    }

    public RegistrationClass() { 
        
    }

    public ArrayList<RegistrationClass> getNewEnroll() {
        return newEnroll;
    }

    public void setNewEnroll(ArrayList<RegistrationClass> newEnroll) {
        this.newEnroll = newEnroll;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
    
}
