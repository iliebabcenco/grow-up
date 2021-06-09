package servlets.cms;

import domain.Article;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.ArticleJDBCImpl;

@WebServlet(name = "cmsshowaddarticleserv", urlPatterns = {"/cms/news"})
public class cmsshowaddarticleserv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArticleJDBCImpl artJdService = (ArticleJDBCImpl) request.getServletContext().getAttribute("artService");

        List<Article> listaDeArticole = artJdService.findAll();
        request.setAttribute("listaDeArticole", listaDeArticole);
        Article art = (Article) request.getAttribute("articolSelectat");
        if (art == null) {
            art = new Article(0, "", "");
        }
        request.setAttribute("articolSelectat", art);
        request.getRequestDispatcher("/WEB-INF/pages/cms/cmsaddarticle.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
