/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.academicStaff;

import dal.GSMDBContext;
import dal.GroupDBContext;
import dal.InstructorDBContext;
import dal.StudentDBContext;
import dal.SubjectDBContext;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.Instructor;
import entity.Student;
import entity.Subject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class InfoClassController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InstructorDBContext idb = new InstructorDBContext();
        SubjectDBContext sdb = new SubjectDBContext();
        GroupDBContext gdb = new GroupDBContext();
        StudentDBContext studb = new StudentDBContext();
        GSMDBContext gsmdb = new GSMDBContext();
        try {
            Group gNewest = gdb.getClassNewset();
            List<GroupSubjectMapping> listGSM = gsmdb.getAllClass();
            List<Instructor> listIns = idb.getAllInstructor();
            List<Subject> listSub = sdb.getAllSubject();
            List<Group> listG = gdb.getAllClass();
            List<Student> listStu = studb.getAllStudent();
            
            request.setAttribute("listIns", listIns);
            request.setAttribute("listSub", listSub);
            request.setAttribute("listG", listG);
            request.setAttribute("listStu", listStu);
            request.setAttribute("gNewest", gNewest);
            request.setAttribute("listGSM", listGSM);
            
//            request.getRequestDispatcher("listClass.jsp").forward(request, response);
            request.getRequestDispatcher("createClass.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InfoClassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       processRequest(request, response);
    } 
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
