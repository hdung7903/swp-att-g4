/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.account;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
       String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember");

        Cookie cuser = new Cookie("cuser", username);
        Cookie cpass = new Cookie("cpass", password);
        Cookie crmb = new Cookie("crmb", rememberMe);

        if (rememberMe != null) {
            cuser.setMaxAge(60 * 60 * 24 * 1);
            cpass.setMaxAge(60 * 60 * 24 * 1);
            crmb.setMaxAge(60 * 60 * 24 * 1);
        } else {
            cuser.setMaxAge(0);
            cpass.setMaxAge(0);
            crmb.setMaxAge(0);
        }

        response.addCookie(cuser);
        response.addCookie(cpass);
        response.addCookie(crmb);
        
        AccountDBContext DAO = new AccountDBContext();
        Account a = DAO.ValidateAccount(username, password);
        

        if (a == null) {
            request.setAttribute("mess", "Wrong username or password");
            request.getRequestDispatcher("./login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(100000);
            Account getAccountId = DAO.getAccountIdByUsername(username);
            String accountId=null;
            if(getAccountId.getInstructor()!=null){
                accountId=getAccountId.getInstructor().getId();
            }else if(getAccountId.getStudent().getId()!=null){
                accountId=getAccountId.getStudent().getId();
            }
            session.setAttribute("accountId", accountId);
            if (a.role_id == 1) {
                    response.sendRedirect(request.getContextPath()+"/academicStaff/home");
            }
            if (a.role_id == 2) {
                response.sendRedirect(request.getContextPath()+"/admin/home");
            }
            if (a.role_id == 3) {
                response.sendRedirect(request.getContextPath()+"/instructor/home");
            }
            if (a.role_id == 4) {
                response.sendRedirect(request.getContextPath()+"/student/home");
            }
        }
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
