/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.academicStaff;

import dal.GSMDBContext;
import dal.GroupDBContext;
import dal.SCMDBContext;
import dal.StudentDBContext;
import entity.Group;
import entity.GroupSubjectMapping;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class AddStudentController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
        try {
            String class_id = request.getParameter("id");
            GroupDBContext gdb = new GroupDBContext();
            StudentDBContext stuDB = new StudentDBContext();

            Group gNewest = gdb.getClassById(class_id);
            List<Student> listStu = stuDB.getAllStudent();

            request.setAttribute("gNew", gNewest);
            request.setAttribute("listStu", listStu);
            request.getRequestDispatcher("../academicStaff/addStudent.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddStudentController.class.getName()).log(Level.SEVERE, null, ex);
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
        String[] stuIds = request.getParameterValues("stuId");
        String class_id = request.getParameter("class_id");

        SCMDBContext scmDB = new SCMDBContext();
        for (String stu_id : stuIds) {
            scmDB.insertStuinClass(stu_id, class_id);
        }
        response.sendRedirect(request.getServletContext().getContextPath() +"/acad/addInsAndSub?id=" + class_id);
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
