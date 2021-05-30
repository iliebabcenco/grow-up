
package servlets.cms;

import domain.Request;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.RequestDaoJDBCImpl;


@WebServlet(name = "cmsaddeditrequest", urlPatterns = {"/cms/cmsaddeditrequest"})
public class cmsaddeditrequest extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDaoJDBCImpl requestService  = (RequestDaoJDBCImpl) getServletContext().getAttribute("reqService");
        String action = request.getParameter("action");
        String id = request.getParameter("reqId");
        int reqId = 0;
        try {
            reqId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            throw new NumberFormatException("ID incorect");
        }
        Request req = requestService.findById(reqId);
        if (req == null) {
            req = new Request();
        }
        request.setAttribute("selectedRequest", req);
        request.getRequestDispatcher("/WEB-INF/pages/cms/cmsaddeditrequest.jsp").forward(request, response);
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
