package servlets;

import domain.Article;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.ArticleJDBCImpl;

@WebServlet(name = "newsserv", urlPatterns = {"/newsserv"})
public class newsserv extends HttpServlet {

    ArticleJDBCImpl artJdService = null;

    @Override
    public void init() throws ServletException {
        super.init();
        artJdService = (ArticleJDBCImpl) getServletContext().getAttribute("artService");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Article> listaDeArticole = artJdService.findAll();

        request.setAttribute("listaDeArticole", listaDeArticole);

        request.getRequestDispatcher("WEB-INF/pages/news.jsp").forward(request, response);
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
