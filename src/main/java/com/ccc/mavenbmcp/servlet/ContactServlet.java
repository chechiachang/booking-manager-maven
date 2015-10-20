/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.servlet;

import com.ccc.mavenbmcp.entity.Contact;
import com.ccc.mavenbmcp.entity.JdbcConnBmcp;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidchang
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/ContactServlet"})
public class ContactServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs;
        try {
            Class.forName(JdbcConnBmcp.DRIVER_MANAGER);
            conn = DriverManager.getConnection(JdbcConnBmcp.DB_URL, JdbcConnBmcp.USER, JdbcConnBmcp.PASS);
            String cmd = request.getParameter("cmd");
            switch(cmd){
                case "get":
                    pstmt = conn.prepareStatement("SELECT * FROM `contact`");
                    rs = pstmt.executeQuery();
                    List contacts = new ArrayList<>();
                    while(rs.next()){
                        Contact contact = new Contact();
                        contact.setId(rs.getInt("id"));
                        contact.setName(rs.getString("name"));
                        contact.setEngName(rs.getString("engName"));
                        contact.setTitle(rs.getString("title"));
                        contact.setDepartment(rs.getString("department"));
                        contact.setEmail(rs.getString("email"));
                        contact.setExt(rs.getString("ext"));
                        contact.setMobile(rs.getString("mobile"));
                        
                        contacts.add(contact);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("contacts", contacts);
                    session.setMaxInactiveInterval(5*60);
                    /*
                    String json = new Gson().toJson(contacts);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    */
                    break;
            }
        } catch (Exception e) {

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
