/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CreateAccount extends HttpServlet {
   
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
            out.println("<title>Servlet CreateAccount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccount at " + request.getContextPath () + "</h1>");
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
        String action = request.getParameter("action");
        if(action.equals("add")) {
         request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        }
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
        AccountDBContext accDAO  = new AccountDBContext();
        String action = request.getParameter("action");
        if(action.equals("add")) {
         String id = request.getParameter("id");
         String type = request.getParameter("type");
         String username = request.getParameter("username");
         String fullname = request.getParameter("fullname");
         String password = request.getParameter("password");
         String email = request.getParameter("email");
         String gender = request.getParameter("gender");
         String dob = request.getParameter("dob");
         String mess = "";
         boolean isSuccess = false;
        if (id.isEmpty() || type.isEmpty() || username.isEmpty() || fullname.isEmpty() 
                || password.isEmpty() || email.isEmpty()
                ||gender.isEmpty() || dob.isEmpty()
                ) {
                mess = "Please fill in all fields.";
                setCommonAttributes(request, response, mess, isSuccess);
                return;
        }
        if (accDAO.getAcountByUsername(username) != null) {
                mess = "The account already is exist.";
                setCommonAttributes(request, response, mess, isSuccess);
                return;
        }
        if (!isValidPassword(password)) {
                mess = "Password must be at least 8 character and combination of letters, numbers, and special characters.";
                setCommonAttributes(request, response, mess, isSuccess);
                return;
        }
        boolean hasInsert = accDAO.insertAccount(id, username, password,
                 Integer.parseInt(type), fullname, email,
                 dob, Integer.parseInt(gender));
         request.setAttribute("result", hasInsert);
         request.setAttribute("mess", hasInsert?"add success":"add error");
         request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        }
    }
    private void setCommonAttributes(HttpServletRequest request,
            HttpServletResponse response, String mess,
            boolean isSuccess) throws ServletException, IOException {
        request.setAttribute("isSuccess", isSuccess);
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("createAccount.jsp").forward(request, response);
    }
    private boolean isValidPassword(String password) {
        // Kiểm tra độ dài mật khẩu và mức độ mạnh
        return password.length() >= 8 && password.matches(".*[A-Z].*") 
                && password.matches(".*[a-z].*") && 
                password.matches(".*\\d.*") && password.matches(".*[!@#$%^&*()].*");
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
