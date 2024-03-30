/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.academicStaff;

import dal.GSMDBContext;
import dal.SCMDBContext;
import dal.SIMDBContext;
import dal.StudentDBContext;
import entity.GroupSubjectMapping;
import entity.Instructor;
import entity.Student;
import entity.SubjectInstructorMapping;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Administrator
 */
public class UpdateClassController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateClassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateClassController at " + request.getContextPath() + "</h1>");
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
        try {
            String csm_id = request.getParameter("csm_id");
            String subject_id = request.getParameter("subject_id");

            GSMDBContext gsmdb = new GSMDBContext();
            SIMDBContext simDB = new SIMDBContext();
            StudentDBContext stuDB = new StudentDBContext();
            SCMDBContext scmDB = new SCMDBContext();

            List<SubjectInstructorMapping> listSim = simDB.getAllInstructorbySubject(subject_id);
            List<Student> listStu = stuDB.getStudentbySubject(subject_id);
            GroupSubjectMapping gsm = gsmdb.getClassByCsmId(csm_id);
            int count = scmDB.countStudent(csm_id);

            request.setAttribute("listStu", listStu);
            request.setAttribute("listSim", listSim);
            request.setAttribute("gsm", gsm);
            request.setAttribute("count", count);
            request.getRequestDispatcher("../academicStaff/csmDetails.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ClassDetailsController.class.getName()).log(Level.SEVERE, null, ex);
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
        String csm_id_raw = request.getParameter("csm_id");
        String instructor_id = request.getParameter("ins");
        String slots = request.getParameter("total_slots");
        String instructor_Name = request.getParameter("name");
        String[] stuIds = request.getParameterValues("stuId");
        
        int slot = Integer.parseInt(slots);
        int csm_id = Integer.parseInt(csm_id_raw);

        GSMDBContext gsmDB = new GSMDBContext();
        GroupSubjectMapping gsm = new GroupSubjectMapping();

        gsm.setId(csm_id);
        gsm.setInstructor(new Instructor(instructor_id, instructor_Name));
        gsm.setTotal_slots(slot);

        gsmDB.updateClass(gsm);

        // Retrieve the updated GroupSubjectMapping object
        GroupSubjectMapping updatedGsm = gsmDB.getClassByCsmId(csm_id_raw);
        String class_id = updatedGsm.getGroup().getId();
        if(stuIds != null){
            SCMDBContext scmDB = new SCMDBContext();
        for (String stu_id : stuIds) {
            scmDB.insertStuinClass(stu_id, class_id, csm_id_raw);
        }
        }
        

        response.sendRedirect(request.getServletContext().getContextPath() + "/acad/details?id=" + class_id);
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
