/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import entity.Session;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author leduy
 */
public class ScheduleController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String instructorId = request.getParameter("id");
        String r_from = request.getParameter("from");
        String r_to = request.getParameter("to");
        ArrayList<Date> dates = new ArrayList<>();

        if (r_from != null && r_to != null) {
            try {
                java.util.Date fromDate = new SimpleDateFormat("yyyy-MM-dd").parse(r_from);
                java.util.Date toDate = new SimpleDateFormat("yyyy-MM-dd").parse(r_to);

                if (toDate.before(fromDate)) {
                    request.setAttribute("errorMessage", "Invalid date range. 'To' date cannot be before 'From' date.");
                    request.getRequestDispatcher("../student/schedule.jsp").forward(request, response);
                    return;
                } else {
                    dates = DateTimeHelper.getSqlDatesInRange(r_from, r_to);
                }
            } catch (ParseException ex) {
                Logger.getLogger(controller.instructor.ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (r_from == null) {
            dates = DateTimeHelper.getCurrentWeekDates();
        }

        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();

        SessionDBContext sessDB = new SessionDBContext();
        ArrayList<Session> sessions = sessDB.getSessionsByInstructor(instructorId, dates.get(0), dates.get(dates.size() - 1));

        request.setAttribute("slots", slots);
        request.setAttribute("dates", dates);
        request.setAttribute("from", dates.get(0));
        request.setAttribute("to", dates.get(dates.size() - 1));
        request.setAttribute("sessions", sessions);

        request.getRequestDispatcher("../student/schedule.jsp").forward(request, response);
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
