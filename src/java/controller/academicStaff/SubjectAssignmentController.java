/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.academicStaff;

import dal.InstructorDBContext;
import dal.SIMDBContext;
import dal.SubjectDBContext;
import entity.Instructor;
import entity.Subject;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SubjectAssignmentController extends HttpServlet {

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
        String instructorId = request.getParameter("instructorId");
        InstructorDBContext insdb = new InstructorDBContext();
        boolean status = false;
        if (instructorId == null) {
            List<Instructor> ins = null;
            try {
                ins = insdb.getAllInstructor();
            } catch (SQLException ex) {
                Logger.getLogger(SubjectAssignmentController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("instructors", ins);
            request.setAttribute("status", status);
            request.getRequestDispatcher("../academicStaff/subjectAssignment.jsp").forward(request, response);
        } else {
            List<Instructor> ins = null;
            try {
                ins = insdb.getAllInstructor();
            } catch (SQLException ex) {
                Logger.getLogger(SubjectAssignmentController.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Subject> unassignedSubjects = null;
            SubjectDBContext subdb = new SubjectDBContext();
            try {
                unassignedSubjects = subdb.getUnassignedSubjects(instructorId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            status = true;
            request.setAttribute("insid", instructorId);
            request.setAttribute("instructors", ins);
            request.setAttribute("unassignedSubjects", unassignedSubjects);
            request.setAttribute("status", status);
            request.getRequestDispatcher("../academicStaff/subjectAssignment.jsp").forward(request, response);
        }
    }

    /**
     * a
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
        String instructorId = request.getParameter("instructorId");
        String[] subjectIdsParam = request.getParameterValues("subjectIds");

        if (instructorId == null || subjectIdsParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing instructor or subject IDs.");
            return;
        }

        List<String> subjectIds = List.of(subjectIdsParam);

        SIMDBContext simDao = new SIMDBContext();
        simDao.insertSubjectAssignment(instructorId, subjectIds);
        
        response.sendRedirect(request.getContextPath() + "/acad/assignsub");
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
