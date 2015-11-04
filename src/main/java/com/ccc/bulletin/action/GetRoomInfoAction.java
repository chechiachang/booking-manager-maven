/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.bulletin.action;

import com.ccc.bulletin.entity.Bulletin;
import com.ccc.bulletin.entity.DeviceData;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author davidchang
 */
@WebServlet(name = "GetRoomInfoAction", urlPatterns = {"/GetRoomInfoAction"})
public class GetRoomInfoAction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static final String DB_URL = "jdbc:mysql://localhost:3306/wulian";
    static final String DRIVER_MANAGER = "com.mysql.jdbc.Driver";
    static final String USER = "kingsbeam";
    static final String PASS = "kingsbeam30985441";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs;

            try {
                Class.forName(DRIVER_MANAGER);
                conn = DriverManager.getConnection(DB_URL, USER, PASS);

                List<String> typeList = new ArrayList<>();
                typeList.add("17");
                typeList.add("42");

                List roomInfos = new ArrayList<>();

                //for each devType in type list
                for (String devType : typeList) {

                    //id list by devType
                    ps = conn.prepareStatement("SELECT DISTINCT `devID` FROM `devices_data` WHERE `devType` = ? ");
                    ps.setString(1, devType);
                    rs = ps.executeQuery();
                    List<String> idList = new ArrayList<>();
                    while (rs.next()) {
                        idList.add(rs.getString("devID"));
                    }

                    //data list by devID
                    for (String id : idList) {
                        ps = conn.prepareStatement("SELECT `devDataText`, `timestamp` FROM `devices_data` WHERE `devID` = ? ORDER BY `id` DESC LIMIT 1");
                        ps.setString(1, id);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            DeviceData deviceData = new DeviceData();
                            deviceData.setDevID(id);
                            deviceData.setDevType(devType);
                            deviceData.setDevDataText(rs.getString("devDataText"));
                            deviceData.setTimestamp(rs.getTimestamp("timestamp"));
                            roomInfos.add(deviceData);
                        }
                    }
                }
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(5 * 60);
                session.setAttribute("roomInfos", roomInfos);

                //bulletin by id
                Bulletin bulletin = new Bulletin();
                ps = conn.prepareStatement("SELECT `devDataText` FROM `devices_data` WHERE `devID` = ? ORDER BY `id` DESC LIMIT 1 ");
                ps.setString(1, "43335702004B1200"); //17
                rs = ps.executeQuery();
                while (rs.next()) {
                    String data = rs.getString("devDataText"); //+22.8,71.8
                    bulletin.setTemp(data.substring(1, 5));
                    bulletin.setHumid(data.substring(6, 10));
                }
                ps.setString(1, "E40DFB04004B1200"); //42
                rs = ps.executeQuery();
                while (rs.next()) {
                    bulletin.setCO2(rs.getString("devDataText")); //745
                }
                session.setAttribute("bulletin", bulletin);

            } catch (Exception e) {

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
