/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.instructor;

import dal.GSMDBContext;
import dal.SCMDBContext;
import entity.GroupSubjectMapping;
import entity.StudentClassMapping;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class ViewStudentListController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String instructorid = (String) session.getAttribute("accountId");
        String csm_id = request.getParameter("csm_id");
        String searchTxt = request.getParameter("search");
        if (searchTxt == null) {
            searchTxt = "";
        } else {
            searchTxt = searchTxt.trim();
        }

        GSMDBContext gsmdb = new GSMDBContext();
        SCMDBContext scmdb = new SCMDBContext();
        ArrayList<GroupSubjectMapping> gsm = gsmdb.getGroupbyInstructor(instructorid);

        ArrayList<StudentClassMapping> scm;

        if (csm_id != null && !csm_id.isEmpty()) {
            scm = scmdb.getStudentbyCMS(csm_id);
        } else {
            scm = scmdb.getStudentbyInstructor(searchTxt, instructorid);
        }

        request.setAttribute("searchTxt", searchTxt);
        request.setAttribute("gsm", gsm);
        request.setAttribute("scm", scm);
        request.getRequestDispatcher("../instructor/studentlist.jsp").forward(request, response);
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