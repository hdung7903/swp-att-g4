/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.academicStaff;

import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.SessionDBContext;
import entity.Attendance;
import entity.Group;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class ViewAttendanceStatistic extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        AttendanceDBContext attdb = new AttendanceDBContext();
        GroupDBContext gdb = new GroupDBContext();
        SessionDBContext sesdb = new SessionDBContext();

        String id = request.getParameter("student_id");

        if (request.getParameter("csmId") != null) {
            int csmId = Integer.parseInt(request.getParameter("csmId"));
            ArrayList<Group> groupList = gdb.getStudentGroup(id);
            List<Attendance> statusRecord = attdb.getStudentAttendanceRecords(id, csmId);
            int totalSes = sesdb.getTotalSessionStudent(csmId, id);
            request.setAttribute("statusRecord", statusRecord);
            request.setAttribute("groupList", groupList);
            request.setAttribute("totalSession", totalSes);
            request.getRequestDispatcher("../academicStaff/attreport.jsp").forward(request, response);

        } else {
            ArrayList<Group> groupList = gdb.getStudentGroup(id);
            request.setAttribute("groupList", groupList);
            request.getRequestDispatcher("../academicStaff/attreport.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewAttendanceStatistic.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewAttendanceStatistic.class.getName()).log(Level.SEVERE, null, ex);
        }
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