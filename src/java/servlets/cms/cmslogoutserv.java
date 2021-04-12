/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AveZomer
 */
@WebServlet(name = "cmslogout", urlPatterns = {"/cms/cmslogoutserv"})
public class cmslogoutserv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = null; //variabila locala

        try {
            HttpSession session = request.getSession();
            if (session == null) {
                throw new Exception("session is null");
            }
//            String sesUser = (String) session.getAttribute("MAINUSER");
//            if (sesUser == null) {
//                throw new Exception("session is null");
//            }
            //daca am ajuns aici insamna ca sesiunea e activa
            //pregatirea pentru iesire
            //remove din sesiune tooate obiectele plasate acolo, distruge sesiune
            session.invalidate(); // am distrus sesiunea
            session = null;
            path = "../home.html";
            System.out.println("am ajuns la sfirstit de try din cms logout");
            response.sendRedirect(path);
            //path = "/WEB-INF/pages/cms/cmsmainpage.jsp";
        } catch (Exception e) {
            path = "../login.html";
            System.out.println("am intrat in eroare cms logout");
           response.sendRedirect(path);
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

}
