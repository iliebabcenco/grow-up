package servlets.cms;

import domain.Request;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.impl.jdbc.RequestDaoJDBCImpl;

@WebServlet(name = "cmsRequestCRUDAllActions", urlPatterns = {"/cms/delete-request", "/cms/save-request", "/cms/edit-request"})
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
                case "Save":
                    saveOrUpdateR(request, response);
                    break;
                case "delete":
                    deleteR(request, response);
                    break;
                case "edit":
                    openEditNew(request, response);
                    break;
                case "open":
                    openEditNew(request, response);
                    break;
                default:
                    arataLista(request, response);
                    break;
            }
        }
    }

    private void arataLista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = null;
        request.setAttribute("listaCererilor", reqService.findAll());
        path = "/WEB-INF/pages/cms/cmsgestiune.jsp";
        request.getRequestDispatcher(path).forward(request, response);

    }

    private void saveOrUpdateR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "";
        Request req = new Request();
        try {
            req.setName(request.getParameter("name"));
            req.setSurename(request.getParameter("surename"));
            req.setBirthday(Date.valueOf(request.getParameter("dataNasterii")));
            req.setCard_id(request.getParameter("buliden"));
            req.setIdnp(request.getParameter("idnp"));
            req.setIncome(request.getParameter("radio"));
            req.setMail(request.getParameter("e-mail"));
            req.setPhone(request.getParameter("phone"));
            String summ = request.getParameter("suma");
            req.setSum(Integer.parseInt(summ));
            String term = request.getParameter("term");
            req.setTerm(Integer.parseInt(term));
            if (term.length() == 6) {
                req.setTerm(Integer.parseInt(term.substring(0, 1)));
            } else if (term.length() == 7) {
                req.setTerm(Integer.parseInt(term.substring(0, 2)));
            }
            req.setResidence(request.getParameter("domiciliu"));

            if (request.getParameter("reqId").equals("0") || request.getParameter("reqId") == null) {
                reqService.save(req);
                request.setAttribute("message", "The request has been successfuly saved!");
            } else {
                int id = Integer.parseInt(request.getParameter("reqId"));
                Request foundReq = (Request) reqService.findById(id);

                if (foundReq == null) {
                    throw new Exception("No such request!!!");
                } else {
                    foundReq.setName(req.getName());
                    foundReq.setBirthday(req.getBirthday());
                    foundReq.setCard_id(req.getCard_id());
                    foundReq.setIdnp(req.getIdnp());
                    foundReq.setIncome(req.getIncome());
                    foundReq.setMail(req.getMail());
                    foundReq.setSurename(req.getSurename());
                    foundReq.setResidence(req.getResidence());
                    foundReq.setPhone(req.getPhone());
                    foundReq.setSum(req.getSum());
                    foundReq.setTerm(req.getTerm());
                    reqService.update(foundReq);
                    request.setAttribute("message", "The request has been successfuly updated!");
                }
            }
            path = "requests";
        } catch (Exception ex) {
            ex.printStackTrace();
            path = "/WEB-INF/pages/error.jsp";
        }

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

    private void openEditNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("reqId");
        String path = "";
        int reqId = 0;
        try {
            reqId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            path = "/WEB-INF/pages/error.jsp";
        }
        Request req = reqService.findById(reqId);
        if (req == null) {
            req = new Request(0, "", "", "", Date.valueOf(LocalDate.MIN), "", "", 0, 0, "", "", "");
        }
        path = "/WEB-INF/pages/cms/cmsaddeditrequest.jsp";
        request.setAttribute("selectedRequest", req);
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
