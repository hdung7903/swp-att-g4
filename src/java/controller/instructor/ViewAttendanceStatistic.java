///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller.instructor;
//
//import dal.AttendanceDBContext;
//import dal.GroupDBContext;
//import dal.SessionDBContext;
//import entity.Group;
//import entity.Student;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.Map;
//
///**
// *
// * @author leduy
// */
//public class ViewAttendanceStatistic extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, SQLException {
//        AttendanceDBContext attdb = new AttendanceDBContext();
//        SessionDBContext sesdb = new SessionDBContext();
//        GroupDBContext gdb = new GroupDBContext();
//        HttpSession session = request.getSession();
//        String id = (String) session.getAttribute("accountId");
//
//        if (request.getParameter("groupId") != null) {
//            int groupId = Integer.parseInt(request.getParameter("groupId"));
//
//            int totalSession = sesdb.getTotalSession(groupId, id);
//            int attended = attdb.sessionAttended(groupId);
//            ArrayList<Group> groupList = gdb.getInstructorGroup(id);
//
//            Map<String, Student> attendanceMap = attdb.getAttendanceRecords(groupId);
//            request.setAttribute("attendanceMap", attendanceMap);
//            request.setAttribute("totalSession", totalSession);
//            request.setAttribute("attended", attended);
//            request.setAttribute("groupList", groupList);
//            request.getRequestDispatcher("../instructor/attreport.jsp").forward(request, response);
//        } else {
//            ArrayList<Group> groupList = gdb.getInstructorGroup(id);
//            request.setAttribute("groupList", groupList);
//            request.getRequestDispatcher("../instructor/attreport.jsp").forward(request, response);
//        }
//    }
//
//// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}