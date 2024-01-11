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
    private int scm_id;
    private String string_id;
    private String class_id;

    public StudentClassMapping() {
    }

    public StudentClassMapping(int scm_id, String string_id, String class_id) {
        this.scm_id = scm_id;
        this.string_id = string_id;
        this.class_id = class_id;
    }

    public int getScm_id() {
        return scm_id;
    }

    public void setScm_id(int scm_id) {
        this.scm_id = scm_id;
    }

    public String getString_id() {
        return string_id;
    }

    public void setString_id(String string_id) {
        this.string_id = string_id;
    }

    public String getClass_id() {
        return class_id;
    }

    public void setClass_id(String class_id) {
        this.class_id = class_id;
    }
    
}
