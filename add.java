/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arul
 */
public class add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String Company =request.getParameter("Company");
            String Owner =request.getParameter("Owner");
             String Found =request.getParameter("Found");
            String Mob =request.getParameter("mobile");
             String Email =request.getParameter("Email");
             String Password =request.getParameter("Password");
             LocalDateTime myObj = LocalDateTime.now();
            String time =myObj.toString();        
            FileWriter fstream = new FileWriter(com.connect.access.user,true);
            try (BufferedWriter out2 = new BufferedWriter(fstream)) {
                Properties p = new Properties();
                p.setProperty(Email+"name",Company);
                p.setProperty(Email+"Owner",Owner);
                p.setProperty(Email+"Found",Found);
                p.setProperty(Email+"Email",Email);
                 p.setProperty(Email+"Mobile",Mob);
                p.setProperty(Email+"password",Password);
                p.setProperty(Email+"time",time);
                p.setProperty(Email+"file", "false");
                p.store(out2, null);
               out.print("<script>alert('Registered success');window.location = 'register.jsp';</script>");
            }catch(Exception e){
                out.print(e);
            }
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
