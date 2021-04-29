/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arul
 */
public class addProduct extends HttpServlet {

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
        Random random = new Random();   
        
        try (PrintWriter out = response.getWriter()) {
          String productName=request.getParameter("Product");
            String company =request.getParameter("owner");;
             String content =request.getParameter("Content");
            String mrp =request.getParameter("Manufacture");
             String ex =request.getParameter("Expired");
             String amount =request.getParameter("Amount");
             int id = random.nextInt(100000); 
              FileWriter fstream = new FileWriter(com.connect.access.block,true);
            try (BufferedWriter out2 = new BufferedWriter(fstream)) {
                Properties p = new Properties();
                p.setProperty(id+"id",String.valueOf(id));
                p.setProperty(id+"productName",productName);
                p.setProperty(id+"Found",company);
                p.setProperty(id+"Email",content);
                 p.setProperty(id+"Mobile",mrp);
                p.setProperty(id+"password",ex);
                p.setProperty(id+"time",amount);               
                p.store(out2, null);
               out.print("<script>alert('Upload success');window.location = 'userhome.jsp';</script>");
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
