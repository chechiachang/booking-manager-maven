/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.nhrservlet;

import com.ccc.mavenbmcp.entity.JdbcConnNhr;
import com.ccc.util.XmlMapping;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet("/NhrDataJsonServlet")
public class NhrDataJsonServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            Connection conn = null;
            Statement stmt = null;
            PreparedStatement pstmt = null;
            ResultSet rs;
            try {
                /*
                 XmlMapping configXml = new XmlMapping(new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/config.xml")));
                 Class.forName(configXml.LookupKey("DRIVER_MANAGER"));
                 conn = DriverManager.getConnection(configXml.LookupKey("DB_URL"), configXml.LookupKey("USER"), configXml.LookupKey("PASS"));
                 */
                Class.forName(JdbcConnNhr.getDRIVER_MANAGER());
                conn = DriverManager.getConnection(JdbcConnNhr.getDB_URL(), JdbcConnNhr.getUSER(), JdbcConnNhr.getPASS());

                String cmd = request.getParameter("cmd");
                switch (cmd) {
                    case "getdata":
                        stmt = conn.createStatement();
                        String strSql = "SELECT `mac_cluster_id`, `short_mac`, `cluster_id`, `data`, `position` From `data`";
                        rs = stmt.executeQuery(strSql);

                        List list = new ArrayList<>();

                        while (rs.next()) {
                            NhrData nhrData = new NhrData();
                            nhrData.setMacClusterId(rs.getString("mac_cluster_id"));
                            nhrData.setShortMac(rs.getString("short_mac"));
                            nhrData.setClusterId(rs.getString("cluster_id"));
                            nhrData.setData(rs.getString("data"));
                            nhrData.setPosition(rs.getString("position"));

                            list.add(nhrData);
                        }
                        rs.close();
                        String json = new Gson().toJson(list);
                        response.setContentType("application/json");
                        response.setContentType("text/html;charset=UTF-8");
                        out.write(json);
                        break;
                }

            } catch (SQLException e) {

            } catch (ClassNotFoundException e) {

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