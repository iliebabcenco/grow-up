package servlets;

import domain.Request;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import services.impl.jdbc.RequestDaoJDBCImpl;
import servlets.cms.cmsArticleCRUDAllActions;

@MultipartConfig
@WebServlet(name = "executeregisteringserv", urlPatterns = {"/executeregisteringserv"})
public class executeregisteringserv extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(cmsArticleCRUDAllActions.class.getCanonicalName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDaoJDBCImpl reqService
                = (RequestDaoJDBCImpl) getServletContext().getAttribute("reqService");

        Request req = new Request();

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

        final String path = request.getServletContext().getRealPath("/") + "userfiles";

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
                LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                        new Object[]{fileName, path});

                fileIS = new FileInputStream(fileDest);
                long size = fileDest.length();
                byte[] fileData = new byte[(int) size];

                fileIS.read(fileData);

                req.setFileName(fileName);
                req.setFileData(fileData);

            } catch (FileNotFoundException fne) {

                LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                        new Object[]{fne.getMessage()});
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
        reqService.save(req);
        request.setAttribute("filename", fileName);
        request.setAttribute("message", "Cererea dvs. a fost validată cu succes, în cel mai scurt timp veți fi contactat.");

        request.getRequestDispatcher("WEB-INF/pages/registering.jsp").forward(request, response);

    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
