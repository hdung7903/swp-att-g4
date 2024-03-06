/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import util.Constants;
import dal.AccountDBContext;
import entity.Account;
import entity.Instructor;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class UserProfileController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            AccountDBContext daoAcc = new AccountDBContext();
            Account acc = (Account) session.getAttribute("acc");
            String newURL = request.getContextPath();
            String service = request.getParameter("Service");
            if (acc != null) {
                if (service == null) {
                    service = Constants.PROFILE_OPTION[0];
                }
                request.setAttribute("currentChoice", service);
                if (service.equals(Constants.PROFILE_OPTION[0])) {
                    switch (acc.role_id) {
                        case 3:
                            Instructor ins = daoAcc.getIntructorByUserName(acc.getUsername());
                            request.setAttribute("currentAcc", ins);
                            request.getRequestDispatcher("/instructor/profile.jsp").forward(request, response);
                            break;
                        case 4:
                            Student stu = daoAcc.getStudentByUserName(acc.getUsername());
                            request.setAttribute("currentAcc", stu);
                            request.getRequestDispatcher("/student/profile.jsp").forward(request, response);
                            break;
                        default:
                            throw new AssertionError();
                    }
                }
                if (service.equals(Constants.PROFILE_OPTION[1])) {
                    switch (acc.role_id) {
                        case 3:
                            request.getRequestDispatcher("/instructor/profile.jsp").forward(request, response);
                            break;
                        case 4:
                            request.getRequestDispatcher("/student/profile.jsp").forward(request, response);
                            break;
                        default:
                            throw new AssertionError();
                    }
                }
            } else {
                response.sendRedirect(newURL + "/login-page");
            }
        }
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
        String currentPassword = request.getParameter("oldPas");
        String newPassword = request.getParameter("newPas");
        String confirmPassword = request.getParameter("confirmPas");
        String mess = "Change password success";
        //check currentPassword
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String newURL = request.getContextPath();
        AccountDBContext daoAcc = new AccountDBContext();
        boolean isSuccess = false;
        if (acc == null) {
            // Điều hướng đến Servlet khác và thay đổi đường dẫn
            response.sendRedirect(newURL + "/login-page");
        } else {
            if (daoAcc.ValidateAccount(acc.getUsername(), currentPassword) != null) {
                if (newPassword.equals(currentPassword)) {
                    isSuccess = false;
                    mess = "You must change new password";
                } else {
                    if (newPassword.equals(confirmPassword)) {
                        daoAcc.changePassword(acc.getUsername(), newPassword);
                        isSuccess = true;
                    } else {
                        mess = "The confirm password incorrect";
                    }
                }
            } else {
                mess = "The current password incorrect";
            }
            request.setAttribute("mess", mess);
            request.setAttribute("isSuccess", isSuccess);
            request.setAttribute("currentChoice", Constants.PROFILE_OPTION[1]);
            if (acc.getRole_id() == 3) {
                request.getRequestDispatcher("/instructor/profile.jsp").forward(request, response);
            }
            if (acc.getRole_id() == 4) {
                request.getRequestDispatcher("/student/profile.jsp").forward(request, response);
            }
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
