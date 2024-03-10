/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDBContext;
import entity.Instructor;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author leduy
 */
public class EditAccountController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        if (role == null) {
            request.getRequestDispatcher("../admin/editaccount.jsp").forward(request, response);
        } else {
            AccountDBContext accdb = new AccountDBContext();
            switch (role) {
                case "stu":
                    Student student = accdb.getStudentByUserName(username);
                    request.setAttribute("studentinfo", student);
                    break;
                case "ins":
                    Instructor instructor = accdb.getIntructorByUserName(username);
                    request.setAttribute("instructorinfo", instructor);
                    break;
            }
            request.getRequestDispatcher("../admin/editaccount.jsp").forward(request, response);
        }
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
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

        AccountDBContext accdb = new AccountDBContext();
        switch (role) {
            case "stu":
                Student student = new Student(null, name, username, email, java.sql.Date.valueOf(dob), gender);
                accdb.updateStudent(student);
                break;
            case "ins":
                Instructor instructor = new Instructor(null, name, username, email, java.sql.Date.valueOf(dob), gender);
                accdb.updateInstructor(instructor);
                break;
        }

        response.sendRedirect("manageacc");
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