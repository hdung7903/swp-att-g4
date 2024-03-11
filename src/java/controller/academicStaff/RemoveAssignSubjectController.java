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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class RemoveAssignSubjectController extends HttpServlet {
    
     /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String instructorId = request.getParameter("instructorId");
        String[] subjectIdsParam = request.getParameterValues("subjectIds");

        if (instructorId == null || subjectIdsParam == null || subjectIdsParam.length == 0) {
            doGet(request, response);
            return;
        }

        List<String> subjectIds = List.of(subjectIdsParam);

        SIMDBContext simDao = new SIMDBContext();
        try {
            simDao.deleteSubjectAssignment(instructorId, subjectIds);
            SubjectDBContext subdb = new SubjectDBContext();
            List<Subject> assignedSubjects = subdb.getAssignedSubjects(instructorId);
            request.setAttribute("assignedSubjects", assignedSubjects);
            response.sendRedirect(request.getContextPath()+"/acad/removesub");
        } catch (SQLException e) {
            e.printStackTrace();
            doGet(request, response);
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String instructorId = request.getParameter("instructorId");
        InstructorDBContext insdb = new InstructorDBContext();
        if (instructorId == null) {
            List<Instructor> ins = null;
            try {
                ins = insdb.getAllInstructor();
            } catch (SQLException ex) {
                Logger.getLogger(RemoveAssignSubjectController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("instructors", ins);
            request.getRequestDispatcher("../academicStaff/subjectRemove.jsp").forward(request, response);
        } else {
            List<Instructor> ins = null;
            try {
                ins = insdb.getAllInstructor();
            } catch (SQLException ex) {
                Logger.getLogger(RemoveAssignSubjectController.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Subject> assignedSubjects = null;
            SubjectDBContext subdb = new SubjectDBContext();
            try {
                assignedSubjects = subdb.getAssignedSubjects(instructorId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("insid", instructorId);
            request.setAttribute("instructors", ins);
            request.setAttribute("assignedSubjects", assignedSubjects);
            request.getRequestDispatcher("../academicStaff/subjectRemove.jsp").forward(request, response);
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
        processRequest(request, response);
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