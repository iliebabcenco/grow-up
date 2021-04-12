/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
