/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Attendance;
import entity.Session;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
@WebServlet(name = "EditAttendanceController", urlPatterns = {"/instructor/editatt"})
public class EditAttendanceController extends HttpServlet {

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
        SessionDBContext sesDB = new SessionDBContext();
        Session s = new Session();
        int id = Integer.parseInt(request.getParameter("id"));
        s.setId(id);
        Session ses = sesDB.get(s);
        request.setAttribute("ses", ses);

        AttendanceDBContext attDB = new AttendanceDBContext();
        ArrayList<Attendance> attendances = attDB.getAttendances(id);

        request.setAttribute("atts", attendances);

        request.getRequestDispatcher("../instructor/editatt.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] stuids = request.getParameterValues("stuid");
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        ArrayList<Attendance> atts = new ArrayList<>();
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            Student s = new Student();
            s.setId(stuid);
            a.setStudent(s);
            a.setSession(ses);
            a.setDescription(request.getParameter("description" + stuid));
            a.setStatus(request.getParameter("status" + stuid).equals("present"));
            atts.add(a);
        }
        ses.setAtts(atts);
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendances(ses);
        request.setAttribute("message", "Attendance updated!");
        response.sendRedirect(request.getContextPath() + "/home");
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
