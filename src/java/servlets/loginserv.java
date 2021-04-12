package servlets;

import domain.GrowUser;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "loginserv", urlPatterns = {"/loginserv"})
public class loginserv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String path = "";
//        try {
//            HttpSession session = request.getSession(false);
//            
//            System.out.println("verificare sesiune = " + (session==null));
//            GrowUser sesUser = (GrowUser) session.getAttribute("MAINUSER");
//            if (sesUser == null) {
//                throw new Exception("username is null");
//           }
//            //System.out.println("verificare User sesiune = " + (sesUser==null));
//            //response.sendRedirect("cms/cmsgestiuneserv");
//            //request.getRequestDispatcher("cms/cmsgestiuneserv").forward(request, response);
//            
//        } catch (Exception ex) {
//            ex.printStackTrace();
            request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
        //}
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
