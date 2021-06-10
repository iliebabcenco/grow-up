package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dispatcher extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = "";
        String pathCerut = request.getServletPath();

        switch (pathCerut) {
            case "/home.html":
                path = "homeserv";
                break;
            case "/aboutus.html":
                path = "aboutusserv";
                break;
            case "/answersquestions.html":
                path = "aqserv";
                break;
            case "/contacts.html":
                path = "contactsserv";
                break;
            case "/howobtain.html":
                path = "howobtainserv";
                break;
            case "/howrefund.html":
                path = "howrefundserv";
                break;
            case "/news.html":
                path = "newsserv";
                break;
            case "/registering.html":
                path = "registrationserv";
                break;
            case "/login.html":
                path = "loginserv";
                break;
            case "cmsgestiune.html":
                path = "cms/cmsgestiuneserv";
                break;
            case "cmsaddarticle.html":
                path = "cms/cmsaddarticleserv";
                break;
            case "cmschangeloan.html":
                path = "cms/cmschangeloanserv";
                break;
            default:
                path = "errorserv";
                break;
        }

        request.getRequestDispatcher(path).forward(request, response);
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
