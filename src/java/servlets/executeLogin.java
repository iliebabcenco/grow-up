package servlets;

import domain.GrowUser;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.impl.jdbc.GrowUserJDBCImpl;
import util.Autentification;
import util.CriptoClass;

@WebServlet(name = "executeLogin", urlPatterns = {"/executeLogin"})
public class executeLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        GrowUserJDBCImpl userService
                = (GrowUserJDBCImpl) getServletContext().getAttribute("usService");

        // am adaugat administratorii in BD
//        GrowUser gu1 = new GrowUser();
//        gu1.setAdmin(true);
//        gu1.setUsername("administrator1");
//        gu1.setPassword(CriptoClass.encrypt("administrator1"));
//        
//        GrowUser gu2 = new GrowUser();
//        gu2.setAdmin(true);
//        gu2.setUsername("administrator2");
//        gu2.setPassword(CriptoClass.encrypt("administrator2"));
//        userService.save(gu2);
//        userService.save(gu1);
        try {
            GrowUser user = Autentification.check(request.getParameter("username"), CriptoClass.encrypt(request.getParameter("password")), userService);
            HttpSession session = request.getSession(true);
            user.setPassword("");
            session.setAttribute("MAINUSER", user);
            response.sendRedirect("cms/requests");
        } catch (Exception ex) {
            String path = "/WEB-INF/pages/login.jsp";
            request.setAttribute("loginerror", "Ați introdus login sau parolă greșită!");
            request.getRequestDispatcher(path).forward(request, response);
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
