/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.servlet;

import com.google.gson.Gson;
import com.ccc.mavenbmcp.entity.JdbcConnBmcp;
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

/**
 *
 * @author davidchang
 */
@WebServlet(name="UserServlet", urlPatterns="{/UserServlet}")
public class UserServlet extends HttpServlet {

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
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Class.forName(JdbcConnBmcp.getDRIVER_MANAGER());
            conn = DriverManager.getConnection(JdbcConnBmcp.getDB_URL(), JdbcConnBmcp.getUSER(), JdbcConnBmcp.getPASS());
            String cmd = request.getParameter("cmd");
            switch (cmd) {
                case "isAdmin": {
                    ps = conn.prepareStatement("SELECT `id` FROM `users` WHERE `name` = ? AND `level` = '2'");
                    ps.setString(1, request.getParameter("name"));
                    rs = ps.executeQuery();
                    List list = new ArrayList<>();
                    while (rs.next()) {
                        list.add("true");
                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }
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
