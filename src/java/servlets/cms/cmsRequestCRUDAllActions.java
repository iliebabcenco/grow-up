package servlets.cms;

import domain.Request;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.RequestDaoJDBCImpl;

@WebServlet(name = "cmsRequestCRUDAllActions", urlPatterns = {"/cms/cmsRequestCRUDAllActions"})
public class cmsRequestCRUDAllActions extends HttpServlet {

    RequestDaoJDBCImpl reqService = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        reqService
                = (RequestDaoJDBCImpl) getServletContext().getAttribute("reqService");
        String action = request.getParameter("action");
        if (action == null) {
            arataLista(request, response);
        } else {
            switch (action) {
                case "saveOrUpdate":
                    saveOrUpdateR(request, response);
                    break;
                case "delete":
                    deleteR(request, response);
                    break;
                case "edit":
                    editR(request, response);
                    break;
                default:
                    arataLista(request, response);
                    break;
            }
        }
    }

    private void arataLista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = null; //variabila locala

        Request req = (Request) request.getAttribute("reqSelectat");
        if (req == null) {
            req = new Request();
        }
        request.setAttribute("reqSelectat", req);

        request.setAttribute("requests", reqService.findAll());

        List<Request> lista = reqService.findAll();

        path = "/WEB-INF/pages/cms/cmsgestiune.jsp";

        request.getRequestDispatcher(path).forward(request, response);

    }

    private void saveOrUpdateR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "";
        try {
            String idStr = request.getParameter("idArticle");
            int id = Integer.parseInt(idStr);
            String title = request.getParameter("titlearticle");
            String content = request.getParameter("articledata");
            Request art = new Request();
            if (id == 0) {
                reqService.save(art);
            } else {
                reqService.update(art);
            }
            path = "cmsarticles";
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", ex.getMessage());
            path = "/WEB-INF/pages/error.jsp";
        }
        System.out.println("am trecut prin metoda saveOrUpdate");

        request.getRequestDispatcher(path).forward(request, response);
    }

    private void deleteR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("reqId");

        try {
            int id = Integer.parseInt(strId);
            Request req = (Request) reqService.findById(id);
            if (req != null) {
                reqService.delete(req);
            }
        } catch (Exception ex) {
            Logger.getLogger(cmsRequestCRUDAllActions.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("cmsgestiuneserv").forward(request, response);
    }

    private void editR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "";
        String idStr = request.getParameter("reqId");
        int id = Integer.parseInt(idStr);
        String setDisplay = "block";
        request.setAttribute("display", setDisplay);
        System.out.println("DISPLAY A FOST SETAT in " + setDisplay);
        try {
            Request art = (Request) reqService.findById(id);
            request.setAttribute("reqSelectat", art);
            path = "cmsgestiuneserv";
        } catch (Exception ex) {
            path = "/WEB-INF/pages/error.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);
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
