
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.GSMDBContext;
import dal.RegistionDBContext;
import dal.SCMDBContext;
import dal.SessionDBContext;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.Registion;
import entity.Session;
import entity.Student;
import entity.StudentClassMapping;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServlet;

/**
 *
 * @author leduy
 */
public class ClassRegistionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String student_id = (String) session.getAttribute("accountId");
        String class_id = request.getParameter("class_id");
        String csm_id_raw = request.getParameter("csm_id");
        int csm_id = Integer.parseInt(csm_id_raw);

        GSMDBContext Id = new GSMDBContext();
        ArrayList<GroupSubjectMapping> gsm = Id.getGSMbyId(csm_id_raw);
        SessionDBContext gdb = new SessionDBContext();
        Session gName = gdb.checkClassStart(csm_id_raw);
        RegistionDBContext rdb = new RegistionDBContext();
        Registion rCheck = rdb.checkStudentExist(csm_id_raw, student_id);

        Registion enroll = new Registion();
        enroll.setStudent(new Student(student_id));
       enroll.setGroup(new Group(class_id));
       enroll.setGsm(new GroupSubjectMapping(csm_id));

        if (gName != null) {
            request.setAttribute("mess", "The class has started!!");
        }  else if (rCheck != null) {
            request.setAttribute("mess", "You have registered for this class!");
        } else {
            rdb.enrollClass(enroll);
            request.setAttribute("mess", "Register successfull!");
        }
//        response.sendRedirect(request.getContextPath() + "/student/enroll");
        request.setAttribute("gsm", gsm);
        request.getRequestDispatcher("../student/enrollClass.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String student_id = (String) session.getAttribute("accountId");
        String searchTxt = request.getParameter("search");
        if (searchTxt == null) {
            searchTxt = "";
        } else {
            searchTxt = searchTxt.trim();
        }

        GSMDBContext groups = new GSMDBContext();
        ArrayList<GroupSubjectMapping> gsm = groups.getGroupsbySubject(searchTxt);
        SCMDBContext list = new SCMDBContext();
        StudentClassMapping gStudent = list.checkSubjectLearnning(searchTxt, student_id);
        
        if (gsm == null || gsm.isEmpty()) {
        request.setAttribute("mess1", "No subject found!");
        } else if (gStudent != null) {
            request.setAttribute("mess1", "You have learned this subject !");
        } 
        
        request.setAttribute("searchTxt", searchTxt);
        request.setAttribute("gsm", gsm);
        request.getRequestDispatcher("../student/enrollClass.jsp").forward(request, response);
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