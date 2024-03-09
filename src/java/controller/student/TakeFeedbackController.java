/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.FeedBackDBContext;
import dal.GSMDBContext;
import entity.FeedBack;
import entity.GroupSubjectMapping;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class TakeFeedbackController extends HttpServlet {

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
        String csm_id = request.getParameter("csm_id");
        
        GSMDBContext groups = new GSMDBContext();
        ArrayList<GroupSubjectMapping> gsm = groups.getGSMbyId(csm_id);
        
        request.setAttribute("gsm", gsm);
        request.getRequestDispatcher("../student/takefb.jsp").forward(request, response);
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
                HttpSession session = request.getSession();
        String student_id = (String) session.getAttribute("accountId");
        int csm_id = Integer.parseInt(request.getParameter("csm_id"));
        int punctuality = Integer.parseInt(request.getParameter("punctuality"));
        int fully_syllabus = Integer.parseInt(request.getParameter("fully_syllabus"));
        int intructor_skills = Integer.parseInt(request.getParameter("intructor_skills"));
        int instructor_support = Integer.parseInt(request.getParameter("instructor_support"));
        String comment = request.getParameter("comment");
        
        FeedBack fb = new FeedBack();
        fb.setStudent(new Student(student_id));
        fb.setGsm(new GroupSubjectMapping(csm_id));
        fb.setPunctuality(punctuality);
        fb.setFully_syllabus(fully_syllabus);
        fb.setIntructor_skills(intructor_skills);
        fb.setInstructor_support(instructor_support);
        fb.setComment(comment);
        
        FeedBackDBContext fbDB = new FeedBackDBContext();
        fbDB.addFeedback(fb);
        response.sendRedirect(request.getContextPath() + "/student/feedback");
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
