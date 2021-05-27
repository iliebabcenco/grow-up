package servlets.cms;

import domain.Request;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import services.impl.jdbc.RequestDaoJDBCImpl;

@WebServlet(name = "cmsRequestCRUDAllActions", urlPatterns = {"/cms/cmsRequestCRUDAllActions"})
public class cmsRequestCRUDAllActions extends HttpServlet {

    RequestDaoJDBCImpl reqService = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        reqService
                = (RequestDaoJDBCImpl) getServletContext().getAttribute("reqService");
        String action = request.getParameter("action");
        System.out.println("All Actions Servlet with action = "+action);
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
        String path = null;
        request.setAttribute("listaCererilor", reqService.findAll());
        path = "/WEB-INF/pages/cms/cmsgestiune.jsp";
        request.getRequestDispatcher(path).forward(request, response);

    }

    private void saveOrUpdateR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "";
        Request req = new Request();
        System.out.println("we are in saveOrUpdate now with name = "+ request.getParameter("name"));
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
            if (summ.length() == 8) {
                req.setSum(Integer.parseInt(summ.substring(0, 4)));
            } else if (summ.length() == 9) {
                req.setSum(Integer.parseInt(summ.substring(0, 5)));
            } else if (summ.length() == 10) {
                req.setSum(Integer.parseInt(summ.substring(0, 6)));
            }
            String term = request.getParameter("term");
            if (term.length() == 6) {
                req.setTerm(Integer.parseInt(term.substring(0, 1)));
            } else if (term.length() == 7) {
                req.setTerm(Integer.parseInt(term.substring(0, 2)));
            }
            req.setResidence(request.getParameter("domiciliu"));
            FileInputStream fileIS = null;
            final String filePath = request.getServletContext().getRealPath("/") + "userfiles";
            final Part filePart = request.getPart("myfile");
            final String fileName = getFileName(filePart);
            if (filePart != null) {
                OutputStream out = null;
                InputStream filecontent = null;
                File fileDest = new File(path + File.separator + fileName);
                try {
                    out = new FileOutputStream(new File(path + File.separator
                            + fileName));
                    filecontent = filePart.getInputStream();

                    int read = 0;
                    final byte[] bytes = new byte[1024];

                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    fileIS = new FileInputStream(fileDest);
                    long size = fileDest.length();
                    byte[] fileData = new byte[(int) size];

                    fileIS.read(fileData);

                    req.setFileName(fileName);
                    req.setFileData(fileData);

                } catch (FileNotFoundException fne) {
                    fne.printStackTrace();
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (filecontent != null) {
                        filecontent.close();
                    }
                    if (fileIS != null) {
                        fileIS.close();
                    }
                }
            }
            request.setAttribute("filename", fileName);

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
                    foundReq.setFileData(req.getFileData());
                    foundReq.setFileName(req.getFileName());
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
            path = "cmsgestiuneserv";
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

    private void editR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "";
        String idStr = request.getParameter("reqId");
        int id = Integer.parseInt(idStr);
        try {
            Request art = (Request) reqService.findById(id);
            request.setAttribute("reqSelectat", art);
            path = "cmsgestiuneserv";
        } catch (Exception ex) {
            path = "/WEB-INF/pages/error.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
