/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Arul
 */
public class autho extends HttpServlet {

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
            HttpSession session=request.getSession();           
            String email =request.getParameter("email");
            String Pass =request.getParameter("phone");
            if(email.equals("admin@mail.com")&&Pass.equals("admin123")){
                response.sendRedirect("home.jsp");
            }
            try{
            FileReader reader=new FileReader(com.connect.access.user);
		Properties p = new Properties(); 
		p.load(reader);
		String user= p.getProperty(email+"Email");
		String password= p.getProperty(email+"password");		
		if(user.equals(email)&&password.equals(Pass)){
                    session.setAttribute("user", user);
		 response.sendRedirect("userhome.jsp");	
		}else{
                    out.print("<script>alert('Login Failed');window.location = 'index.jsp';</script>");
                }
            p.clear();            
            }catch(Exception e){
                 out.print("<script>alert('Login Failed');window.location = 'index.jsp';</script>");
               out.println(e);  
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
