/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import util.Constants;
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
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
            boolean hasExport = exportToExcel(accDAO.getResultSet(), Constants.PATH_DOWN);
            request.setAttribute("result", hasExport);
            request.setAttribute("mess", hasExport?"export success"+Constants.PATH_DOWN:"export error");
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
      
    }
  
    
    public boolean exportToExcel(List<Account> accList, String filePath) {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Order Data");
        // Tạo hàng header
        Row headerRow = sheet.createRow(0);
        String[] headerColumns = {"username", "password", "roleName"};
        for (int i = 0; i < headerColumns.length; i++) {
            org.apache.poi.ss.usermodel.Cell cell = headerRow.createCell(i);
            cell.setCellValue(headerColumns[i]);
        }
        // Đổ dữ liệu từ danh sách vào file Excel
        int rowNum = 1;
        for (Account acc : accList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(acc.getUsername());
            row.createCell(1).setCellValue(acc.getPassword());
            row.createCell(2).setCellValue(acc.getRoleName());
        }
        // Ghi workbook vào file
        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
            System.out.println("Excel file has been created successfully.");
        } catch (IOException e) {
            return false;
        }
        return true;
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
        System.out.println(accDAO.insertAccount(
                "2121", "Phuoc2323", "Phuoc2024@", 4,
                "le phuoc", "phuoc@gmail.com", "2000-01-01", 0));
    }
}
