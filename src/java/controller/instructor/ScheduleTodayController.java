/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

//import controller.authentication.BasedAuthorizationController;
//import controller.authentication.BasedRequiredAuthenticationController;
import dal.SessionDBContext;
import dal.AccountDBContext;
import dal.TimeSlotDBContext;
import entity.Session;
import entity.Account;
import entity.Role;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author Admin
 */
public class ScheduleTodayController extends HttpServlet { //extends BasedAuthorizationController {

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
            String instructorId = request.getParameter("id");
            String dateParam = request.getParameter("day");
            Date dateToday = null;

            if (dateParam != null) {
                try {
                    dateToday = DateTimeHelper.getSqlDatesInDay(dateParam);
                } catch (ParseException ex) {
                    Logger.getLogger(ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (dateParam == null) {
                dateToday = (Date) DateTimeHelper.getCurrentDate();
            }

            TimeSlotDBContext timeDB = new TimeSlotDBContext();
            ArrayList<TimeSlot> slots = timeDB.list();

            SessionDBContext sesDB = new SessionDBContext();
            ArrayList<Session> sessions = sesDB.getSessionsByInstructorToday(instructorId, dateToday);

            request.setAttribute("slots", slots);
            request.setAttribute("day", dateToday);
            request.setAttribute("sessions", sessions);

            request.getRequestDispatcher("../instructor/scheduletoday.jsp").forward(request, response);
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
        processRequest(request, response);
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
