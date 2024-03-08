package controller.academicStaff;

import dal.NewDBContext;
import entity.New;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/acad/updateNews")
public class UpdateNewsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            NewDBContext dbContext = new NewDBContext();
            New news = dbContext.getContentById(id).get(0);
            request.setAttribute("news", news);
            request.getRequestDispatcher("/academicStaff/updateNews.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/acad/listNews");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        NewDBContext dbContext = new NewDBContext();
        New news = new New(id, null, title, content);
        dbContext.update(news);

        response.sendRedirect(request.getContextPath() + "/acad/listNews");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
