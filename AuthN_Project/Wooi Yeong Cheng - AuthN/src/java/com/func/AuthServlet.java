/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.func;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chand
 */
public class AuthServlet extends HttpServlet {


    @Inject 
    AuthBean abean;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession sess = request.getSession();
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                String userid = request.getParameter("usrn");
                String pwd = request.getParameter("pwd");
                if (abean.checkIfLoggedIn(userid)) {
                    request.setAttribute("status", userid);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    String username = abean.loginNow(userid.trim(), pwd.trim());
                    if (username.equals("invalid")) {
                        request.setAttribute("error", "invalid");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        abean.setLoggedInStatus(userid);
                        sess.setAttribute("user", username);
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }
                }
            } else if (action.equals("Logout")) {
                String username = sess.getAttribute("user").toString();
                abean.setLoggedOutStatus(username);
                sess.invalidate();
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(" Exception in AuthN Servlet " + e.getMessage());
            e.printStackTrace();
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
