package servlets.cms;

import services.impl.jdbc.RequestDaoJDBCImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cmsgestiuneserv", urlPatterns = {"/cms/requests"})
public class cmsgestiuneserv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDaoJDBCImpl reqService
                = (RequestDaoJDBCImpl) getServletContext().getAttribute("reqService");
        request.setAttribute("listaCererilor", reqService.findAll());
        request.getRequestDispatcher("/WEB-INF/pages/cms/cmsgestiune.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
