/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class Registion extends BaseEntity {
    private int id;
    private Group group;
    private Student student;

    public Registion() {
    }

    public Registion(int id, Group group, Student student) {
        this.id = id;
        this.group = group;
        this.student = student;
    }

    public Registion(int id) {
        this.id = id;
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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
     
    
}
