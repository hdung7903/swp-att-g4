/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.GSMDBContext;
import dal.RegistrantionClassDBContext;
import dal.SCMDBContext;
import dal.SessionDBContext;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.RegistrationClass;
import entity.Session;
import entity.Student;
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
 * @author Admin
 */
public class EnrollClassController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String searchTxt = request.getParameter("search");
        if (searchTxt == null) {
            searchTxt = "";
        } else {
            searchTxt = searchTxt.trim();
        }

        GSMDBContext groups = new GSMDBContext();
        ArrayList<GroupSubjectMapping> gsm = groups.getGroupsbySubject(searchTxt);

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
        HttpSession session = request.getSession();
        String student_id = (String) session.getAttribute("accountId");
        String class_id = request.getParameter("class_id");

        GSMDBContext Id = new GSMDBContext();
        int cms_id = Id.getGSM_Id(student_id, class_id);
        SessionDBContext gdb = new SessionDBContext();
        ArrayList<Session> gName = gdb.checkClassStart(cms_id);
        SCMDBContext list = new SCMDBContext();
        ArrayList<StudentClassMapping> gStudent = list.checkStudentExist(class_id, student_id);

        RegistrationClass enroll = new RegistrationClass();
        enroll.setStudent(new Student(student_id));
        enroll.setGroup(new Group(class_id));
        RegistrantionClassDBContext sdb = new RegistrantionClassDBContext();
//        sdb.enrollClass(enroll);
//        request.setAttribute("mess", "Enroll successfull!");

        if (gName != null) {
            request.setAttribute("mess", "Class name has started studying!");
        } else if (gStudent != null) {
            request.setAttribute("mess", "You has been in class!");
        } else {
            sdb.enrollClass(enroll);
            request.setAttribute("mess", "Enroll successfull!");
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
