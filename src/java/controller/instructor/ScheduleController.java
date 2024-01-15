/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import dal.AccountDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author leduy
 */
public class ScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String instructor_id)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account loggedUser = (Account) session.getAttribute("account");

        if (loggedUser != null) {
            String username = loggedUser.getUsername();
            AccountDBContext dbContext = new AccountDBContext();
            Account account = dbContext.getAccountIdByUsername(username);

            if (account.getInstructor() != null) {
                instructor_id = account.getInstructor().getInstructor_id();
            }

            String r_from = request.getParameter("from");
            String r_to = request.getParameter("to");
            ArrayList<Date> dates = new ArrayList<>();

            if (r_from == null) {
                dates = DateTimeHelper.getCurrentWeekDates();
            } else {
                try {
                    dates = DateTimeHelper.getSqlDatesInRange(r_from, r_to);
                } catch (ParseException ex) {
                    Logger.getLogger(ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            SessionDBContext sesDB = new SessionDBContext();
            ArrayList<Session> sessions = sesDB.getSessionsByInstrucor(instructor_id, dates.get(0), dates.get(dates.size() - 1));

            request.setAttribute("dates", dates);
            request.setAttribute("from", dates.get(0));
            request.setAttribute("to", dates.get(dates.size() - 1));
            request.setAttribute("sessions", sessions);
        }

        request.getRequestDispatcher("...").forward(request, response);
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
