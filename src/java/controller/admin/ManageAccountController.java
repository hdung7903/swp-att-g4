/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import constant.IConstant;
import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.List;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author leduy
 */
public class ManageAccountController extends HttpServlet {
    AccountDBContext accDAO  = new AccountDBContext();
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
            out.println("<title>Servlet ManageAccountController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageAccountController at " + request.getContextPath () + "</h1>");
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
        if(action == null) {
         commonDirect(request, response, false);
         request.getRequestDispatcher("manageAccount.jsp").forward(request, response);
        }
        if(action.equals("add")) {
         request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        }
        if(action.equals("search")) {
         String searchTxt = request.getParameter("q").trim();
         String deleted = request.getParameter("deleted");
         boolean isDeleted = Boolean.valueOf(deleted);
         String role_raw = request.getParameter("role");
         int role = Integer.parseInt(role_raw);
         if(role == 0) {
             request.setAttribute("listStudent", accDAO.getAllStudent(searchTxt, isDeleted));
             request.setAttribute("listInstructor", accDAO.getAllInstructor(searchTxt, isDeleted));
             request.setAttribute("listManage", accDAO.getAllManage(searchTxt, role, isDeleted));
         } else if(role == 1 || role == 2) {
              request.setAttribute("listManage", accDAO.getAllManage(searchTxt, role, isDeleted));
         }else if(role == 3) {
              request.setAttribute("listInstructor", accDAO.getAllInstructor(searchTxt, isDeleted));
         } else if(role == 4) {
              request.setAttribute("listStudent", accDAO.getAllStudent(searchTxt, isDeleted));
         }
         request.setAttribute("searchTxt", searchTxt);
         request.setAttribute("role", role);
         if(isDeleted) {
          request.getRequestDispatcher("manageAccountDelete.jsp").forward(request, response);
         } else {
           request.getRequestDispatcher("manageAccount.jsp").forward(request, response);
         }
        }
        if(action.equals("delete")) {
         String username = request.getParameter("username");
         boolean hasDelete = accDAO.deleteAccount(username);
         request.setAttribute("result", hasDelete);
         request.setAttribute("mess", hasDelete?"permanently deleted success":"permanently deleted error");
         commonDirect(request, response, true);
         request.getRequestDispatcher("manageAccountDelete.jsp").forward(request, response);
        }
        if(action.equals("deletedList")) {
         commonDirect(request, response, true);
         request.getRequestDispatcher("manageAccountDelete.jsp").forward(request, response);
        }
        if(action.equals("restore")) {
         String username = request.getParameter("username");
         boolean hasRestore = accDAO.restoreAccount(username);
         request.setAttribute("result", hasRestore);
         request.setAttribute("mess", hasRestore?"restore success":"restore error");
         commonDirect(request, response, true);
         request.getRequestDispatcher("manageAccountDelete.jsp").forward(request, response);
        }
        
        if(action.equals("deletedRule")) {
         String username = request.getParameter("username");
         boolean hasDeleteRule = accDAO.deleteRuleAccount(username);
         request.setAttribute("result", hasDeleteRule);
         request.setAttribute("mess", hasDeleteRule?"delete success":"delete error");
         commonDirect(request, response, true);
         request.getRequestDispatcher("manageAccountDelete.jsp").forward(request, response);
        }
        if(action.equals("exprortExcel")) {
//            boolean hasExport = exportToExcel(accDAO.getResultSet(), "D:/allOrders.xlsx");
//            request.setAttribute("result", hasExport);
//            request.setAttribute("mess", hasExport?"export success"+IConstant.PATH_DOWN:"export error");
            commonDirect(request, response, false);
            request.getRequestDispatcher("manageAccount.jsp").forward(request, response);
        }
    } 
    
    public void commonDirect(HttpServletRequest request, HttpServletResponse response, boolean isDeletedRule)
    throws ServletException, IOException {
         request.setAttribute("listStudent", accDAO.getAllStudent(null, isDeletedRule));
         request.setAttribute("listInstructor", accDAO.getAllInstructor(null, isDeletedRule));
         request.setAttribute("listManage", accDAO.getAllManage(null, 0, isDeletedRule));
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
 public static void main(String[] args) {
        AccountDBContext accDAO  = new AccountDBContext();
        System.out.println(accDAO.deleteRuleAccount("student1"));
//        System.out.println(accDAO.getResultSet());
    }
}
