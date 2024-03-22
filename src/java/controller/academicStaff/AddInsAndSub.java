/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.academicStaff;

import dal.GSMDBContext;
import dal.GroupDBContext;
import dal.InstructorDBContext;
import dal.SubjectDBContext;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.Instructor;
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
public class AddInsAndSub extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String class_id = request.getParameter("id");

            GroupDBContext gdb = new GroupDBContext();
            SubjectDBContext sdb = new SubjectDBContext();

            List<Subject> listSub = sdb.getAllSubject();
            Group gNewest = gdb.getClassById(class_id);

            request.setAttribute("listSub", listSub);
            request.setAttribute("gNew", gNewest);
            request.getRequestDispatcher("../academicStaff/addClass.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddInsAndSub.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        String subId = request.getParameter("sub");
        String slot = request.getParameter("slot");
        String class_id = request.getParameter("class_id");

        GroupDBContext gdb = new GroupDBContext();
        SubjectDBContext sdb = new SubjectDBContext();
        GSMDBContext gsmDB = new GSMDBContext();

        List<Subject> listSub = sdb.getAllSubject();
        Group gNewest = gdb.getClassById(class_id);

        boolean gsmCheck = gsmDB.checkSubjectExist(class_id, subId);
        if (gsmCheck == true) {
            request.setAttribute("listSub", listSub);
            request.setAttribute("gNew", gNewest);
            request.setAttribute("mess", "Subject has exist in this class");
            request.getRequestDispatcher("addClass").forward(request, response);
        } else {
            gsmDB.insertClass(class_id, subId, slot);
            response.sendRedirect(request.getServletContext().getContextPath() +"/acad/details?id=" + class_id); 
        }} catch (SQLException ex) {
            Logger.getLogger(AddInsAndSub.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
