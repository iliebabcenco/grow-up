package servlets.cms;

import domain.Article;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.ArticleJDBCImpl;

@WebServlet(name = "cmsArticleCRUDAllActions", urlPatterns = {"/cms/news-actions"})
public class cmsArticleCRUDAllActions extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(cmsArticleCRUDAllActions.class.getCanonicalName());
    ArticleJDBCImpl artJdService = null;

    @Override
    public void init() throws ServletException {
        super.init();
        artJdService = (ArticleJDBCImpl) getServletContext().getAttribute("artService");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            arataLista(request, response);
        } else {
            switch (action) {
                case "Save":
                    saveOrUpdateC(request, response);
                    break;
                case "delete":
                    deleteArt(request, response);
                    break;
                case "edit":
                    editArt(request, response);

                    break;
                default:
                    arataLista(request, response);
                    break;
            }
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

    private void saveOrUpdateC(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = "";
        try {
            String title = request.getParameter("titletext");
            String content = request.getParameter("editor1");
            if (request.getParameter("idtext").equals("0") || request.getParameter("idtext") == null) {
                Article art = new Article(0, title, content);
                artJdService.save(art);
            } else {
                int id = Integer.parseInt(request.getParameter("idtext"));
                Article articolDinService = (Article) artJdService.findById(id);
                if (articolDinService == null) {
                    throw new Exception("No such article!!!");
                } else {
                    articolDinService.setTitle(title);
                    articolDinService.setContent(content);
                    artJdService.update(articolDinService);
                }
            }
            path = "news";
        } catch (Exception ex) {
            ex.printStackTrace();
            path = "/WEB-INF/pages/error.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);

    }

    private void arataLista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = null;

        Article art = (Article) request.getAttribute("articolSelectat");
        if (art == null) {
            art = new Article(0, "", "");
        }
        List<Article> lista = artJdService.findAll();
        request.setAttribute("articolSelectat", art);
        request.setAttribute("listaDeArticole", lista);
        path = "/WEB-INF/pages/cms/cmsaddarticle.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }

    private void deleteArt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("artId");
        int id = Integer.parseInt(strId);
        Article art = null;
        try {
            art = (Article) artJdService.findById(id);
            if (art != null) {
                artJdService.delete(art);
            }
        } catch (Exception ex) {
            Logger.getLogger(cmsArticleCRUDAllActions.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("news").forward(request, response);
    }

    private void editArt(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = "";
        String idStr = request.getParameter("artId");
        int id = Integer.parseInt(idStr);
        try {
            Article art = (Article) artJdService.findById(id);
            request.setAttribute("articolSelectat", art);
            path = "news";
        } catch (Exception ex) {
            path = "/WEB-INF/pages/error.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

}
