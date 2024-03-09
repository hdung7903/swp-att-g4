/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Registion;
import entity.Student;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class RegistionDBContext extends DBContext<Registion>{
    
    public List<Registion> getAllRegistion() {
    List<Registion> listRes = new ArrayList<>();
    String sql = """
                   SELECT regis_id, c.class_name, c.class_id, s.student_name, s.student_id
                   FROM registion res
                   INNER JOIN class c ON c.class_id = res.class_id
                   INNER JOIN student s ON s.student_id = res.student_id
                   order by res.class_id;
                 """;
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Registion res = new Registion();
            Group group = new Group();
            Student student = new Student();
            
            String id = rs.getString("regis_id");
            group.setId(rs.getString("class_id"));
            group.setClass_name(rs.getString("class_name"));
            student.setId(rs.getString("student_id"));
            student.setName(rs.getString("student_name"));
            
           res.setId(id);
           res.setGroup(group);
           res.setStudent(student);

            listRes.add(res);
        }
        return listRes;
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
    }
    
    public void deleteRes(String regis_id) {
        try {
            String sql = "DELETE FROM registion WHERE regis_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, regis_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        RegistionDBContext gsmDB = new RegistionDBContext();
        List<Registion> list = gsmDB.getAllRegistion();
        for (Registion registion : list) {
        System.out.println("Registration ID: " + registion.getId());
        System.out.println("Class ID: " + registion.getGroup().getId());
        System.out.println("Class Name: " + registion.getGroup().getClass_name());
        System.out.println("Student ID: " + registion.getStudent().getId());
        System.out.println("Student Name: " + registion.getStudent().getName());
        System.out.println("----------------------");
    }
    }

    @Override
    public ArrayList<Registion> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Registion get(Registion entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
