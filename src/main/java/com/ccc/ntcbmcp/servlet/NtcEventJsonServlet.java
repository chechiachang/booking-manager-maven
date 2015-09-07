/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.ntcbmcp.servlet;

import com.google.gson.Gson;
import com.ccc.ntcbmcp.entity.NtcEvent;
import com.ccc.mavenbmcp.entity.Room;
import com.ccc.util.XmlMapping;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
//@WebServlet(name = "NtcEventJsonServlet", urlPatterns = "{NtcEventJsonServlet}")
public class NtcEventJsonServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs;

        try {
            XmlMapping xmlConfig = new XmlMapping(new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/config.xml")));
            Class.forName(xmlConfig.LookupKey("DRIVER_MANAGER"));
            conn = DriverManager.getConnection(xmlConfig.LookupKey("DB_URL"), xmlConfig.LookupKey("USER"), xmlConfig.LookupKey("PASS"));

            String cmd = request.getParameter("cmd");
            String roomId = request.getParameter("roomId");
            switch (cmd) {
                case "get": {
                    stmt = conn.createStatement();
                    String strSql = "SELECT `id`, `roomId`, `unit`, `start`, `end`, `showtime`, `apply`, `pricing`, `phone1`, `phone2`, "
                            + "`title`, `servant`, `description`, `central`, `cleaner`, `createdBy`, `modifiedBy`, `memo` "
                            + "FROM `room_events` "
                            + "WHERE `deleted` != '1' ORDER BY `id`";
                    rs = stmt.executeQuery(strSql);
                    List list = new ArrayList<>();
                    while (rs.next()) {
                        NtcEvent ntcevent = new NtcEvent();
                        ntcevent.setId(rs.getInt("id"));
                        ntcevent.setRoomId(Integer.valueOf(rs.getString("roomId")));
                        ntcevent.setResources(rs.getString("roomId"));
                        ntcevent.setUnit(rs.getString("unit"));
                        ntcevent.setStart(rs.getString("start").replace(" ", "T"));
                        ntcevent.setEnd(rs.getString("end").replace(" ", "T"));
                        ntcevent.setShowtime(rs.getString("showtime"));
                        ntcevent.setApply(rs.getString("apply"));
                        ntcevent.setPricing(rs.getString("pricing"));
                        ntcevent.setPhone1(rs.getString("phone1"));
                        ntcevent.setPhone2(rs.getString("phone2"));
                        ntcevent.setTitle(rs.getString("title"));
                        ntcevent.setServant(rs.getString("servant"));
                        ntcevent.setDescription(rs.getString("description"));
                        ntcevent.setCentral(rs.getString("central"));
                        ntcevent.setCleaner(rs.getString("cleaner"));
                        ntcevent.setCreatedBy(rs.getString("createdBy"));
                        ntcevent.setModifiedBy(rs.getString("modifiedBy"));
                        ntcevent.setMemo(rs.getString("memo"));

                        list.add(ntcevent);
                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }
                case "time": {
                    String date = request.getParameter("date"); //2015-00-00
                    pstmt = conn.prepareStatement("SELECT t1.`id`, t1.`roomId`, t2.`name`, `unit`, `start`, `end`, `showtime`, `apply`, `pricing`, `phone1`, `phone2`, "
                            + "`title`, `servant`, `description`, `central`, `cleaner`, `createdBy`, `modifiedBy`, `memo` "
                            + "FROM `room_events` AS t1 Left JOIN `rooms` AS t2 "
                            + "ON t1.`roomId` = t2.`roomId` "
                            + "WHERE `deleted` != '1' AND `start` > ? AND `start` < ? "
                            + "ORDER BY `id`");
                    pstmt.setString(1, date);
                    String end = date.substring(0, 8) + String.valueOf(Integer.valueOf(date.substring(8, 10)) + 1);
                    pstmt.setString(2, end);
                    rs = pstmt.executeQuery();
                    List list = new ArrayList<>();
                    while (rs.next()) {
                        NtcEvent ntcevent = new NtcEvent();
                        ntcevent.setId(rs.getInt("id"));
                        ntcevent.setRoomName(rs.getString("name"));
                        ntcevent.setRoomId(Integer.valueOf(rs.getString("roomId")));
                        ntcevent.setResources(rs.getString("roomId"));
                        ntcevent.setUnit(rs.getString("unit"));
                        ntcevent.setStart(rs.getString("start").replace(" ", "T"));
                        ntcevent.setEnd(rs.getString("end").replace(" ", "T"));
                        ntcevent.setShowtime(rs.getString("showtime"));
                        ntcevent.setApply(rs.getString("apply"));
                        ntcevent.setPricing(rs.getString("pricing"));
                        ntcevent.setPhone1(rs.getString("phone1"));
                        ntcevent.setPhone2(rs.getString("phone2"));
                        ntcevent.setTitle(rs.getString("title"));
                        ntcevent.setServant(rs.getString("servant"));
                        ntcevent.setDescription(rs.getString("description"));
                        ntcevent.setCentral(rs.getString("central"));
                        ntcevent.setCleaner(rs.getString("cleaner"));
                        ntcevent.setCreatedBy(rs.getString("createdBy"));
                        ntcevent.setModifiedBy(rs.getString("modifiedBy"));
                        ntcevent.setMemo(rs.getString("memo"));

                        list.add(ntcevent);
                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }
                case "times": {
                    String date = request.getParameter("date"); //2015-00-00
                    String end = request.getParameter("end");
                    pstmt = conn.prepareStatement("SELECT t1.`id`, t1.`roomId`, t2.`name`, `unit`, `start`, `end`, `showtime`, `apply`, `pricing`, `phone1`, `phone2`, "
                            + "`title`, `servant`, `description`, `central`, `cleaner`, `createdBy`, `modifiedBy`, `memo` "
                            + "FROM `room_events` AS t1 Left JOIN `rooms` AS t2 "
                            + "ON t1.`roomId` = t2.`roomId` "
                            + "WHERE `deleted` != '1' AND `start` > ? AND `start` < ? "
                            + "ORDER BY `id`");
                    pstmt.setString(1, date);
                    pstmt.setString(2, end);
                    rs = pstmt.executeQuery();

                    List list = new ArrayList<>();
                    //mark date

                    while (rs.next()) {
                        //read each ntcevent
                        NtcEvent ntcevent = new NtcEvent();
                        ntcevent.setId(rs.getInt("id"));
                        ntcevent.setRoomName(rs.getString("name"));
                        ntcevent.setRoomId(Integer.valueOf(rs.getString("roomId")));
                        ntcevent.setResources(rs.getString("roomId"));
                        ntcevent.setUnit(rs.getString("unit"));
                        ntcevent.setStart(rs.getString("start").replace(" ", "T"));
                        ntcevent.setEnd(rs.getString("end").replace(" ", "T"));
                        ntcevent.setShowtime(rs.getString("showtime"));
                        ntcevent.setApply(rs.getString("apply"));
                        ntcevent.setPricing(rs.getString("pricing"));
                        ntcevent.setPhone1(rs.getString("phone1"));
                        ntcevent.setPhone2(rs.getString("phone2"));
                        ntcevent.setTitle(rs.getString("title"));
                        ntcevent.setServant(rs.getString("servant"));
                        ntcevent.setDescription(rs.getString("description"));
                        ntcevent.setCentral(rs.getString("central"));
                        ntcevent.setCleaner(rs.getString("cleaner"));
                        ntcevent.setCreatedBy(rs.getString("createdBy"));
                        ntcevent.setModifiedBy(rs.getString("modifiedBy"));
                        ntcevent.setMemo(rs.getString("memo"));

                        list.add(ntcevent);

                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }

                case "rooms": {
                    String class_id = request.getParameter("classId");  //int string
                    stmt = conn.createStatement();
                    String strSql = "SELECT `roomId`, `name`, `text`, `color` FROM `rooms` WHERE `class_id` = '" + class_id + "' ";
                    rs = stmt.executeQuery(strSql);
                    List<Room> list = new ArrayList<>();
                    while (rs.next()) {
                        Room room = new Room();
                        room.setId(rs.getInt("roomId"));
                        room.setRoomId(rs.getInt("roomId"));
                        room.setName(rs.getString("name"));
                        room.setText(rs.getString("text"));
                        room.setColor(rs.getString("color"));
                        list.add(room);
                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }
                case "allrooms": {
                    stmt = conn.createStatement();
                    String strSql = "SELECT `roomId`, `name`, `text`, `color` FROM `rooms` ORDER BY `id` ";
                    rs = stmt.executeQuery(strSql);
                    List<Room> list = new ArrayList<>();
                    while (rs.next()) {
                        Room room = new Room();
                        room.setId(rs.getInt("roomId"));
                        room.setRoomId(rs.getInt("roomId"));
                        room.setName(rs.getString("name"));
                        room.setText(rs.getString("text"));
                        room.setColor(rs.getString("color"));
                        list.add(room);
                    }
                    rs.close();
                    String json = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.setContentType("text/html;charset=UTF-8");
                    out.write(json);
                    break;
                }
                case "insert": {
                    stmt = conn.createStatement();
                    String strSql = "INSERT INTO `room_events` SET "
                            + "`roomId` = '" + request.getParameter("roomId") + "', "
                            + "`unit` = '" + request.getParameter("unit") + "', "
                            + "`apply` = '" + request.getParameter("apply") + "', "
                            + "`pricing` = '" + request.getParameter("pricing") + "', "
                            + "`phone1` = '" + request.getParameter("phone1") + "', "
                            + "`phone2` = '" + request.getParameter("phone2") + "', "
                            + "`title` = '" + request.getParameter("title") + "', "
                            + "`servant` = '" + request.getParameter("servant") + "', "
                            + "`description` = '" + request.getParameter("description") + "', "
                            + "`central` = '" + request.getParameter("central") + "', "
                            + "`cleaner` = '" + request.getParameter("cleaner") + "', "
                            + "`staff` = '" + request.getParameter("staff") + "', "
                            + "`createdBy` = '" + request.getParameter("createdBy") + "', "
                            + "`showtime` = '" + request.getParameter("showtime") + "', "
                            + "`start` = '" + URLDecoder.decode(request.getParameter("startDate"), "UTF-8") + " " + URLDecoder.decode(request.getParameter("startTime"), "UTF-8") + ":00' ,"
                            + "`end` = '" + URLDecoder.decode(request.getParameter("endDate"), "UTF-8") + " " + URLDecoder.decode(request.getParameter("endTime"), "UTF-8") + ":00' ";
                    stmt.executeUpdate(strSql);
                    HttpSession session = request.getSession();
                    session.setAttribute(("previousDate"), request.getParameter("startDate"));
                    session.setMaxInactiveInterval(5 * 60);
                    response.sendRedirect("ntcbmcp.jsp");
                    break;
                }
                case "update": {
                    stmt = conn.createStatement();
                    String strSql = "UPDATE `room_events` SET "
                            + "`roomId` = '" + request.getParameter("roomId") + "', "
                            + "`unit` = '" + request.getParameter("unit") + "', "
                            + "`apply` = '" + request.getParameter("apply") + "', "
                            + "`pricing` = '" + request.getParameter("pricing") + "', "
                            + "`phone1` = '" + request.getParameter("phone1") + "', "
                            + "`phone2` = '" + request.getParameter("phone2") + "', "
                            + "`title` = '" + request.getParameter("title") + "', "
                            + "`servant` = '" + request.getParameter("servant") + "', "
                            + "`description` = '" + request.getParameter("description") + "', "
                            + "`central` = '" + request.getParameter("central") + "', "
                            + "`cleaner` = '" + request.getParameter("cleaner") + "', "
                            + "`staff` = '" + request.getParameter("staff") + "', "
                            + "`modifiedBy` ='" + request.getParameter("modifiedBy") + "', "
                            + "`showtime` = '" + request.getParameter("showtime") + "', "
                            + "`start` = '" + URLDecoder.decode(request.getParameter("startDate"), "UTF-8") + " " + URLDecoder.decode(request.getParameter("startTime"), "UTF-8") + ":00', "
                            + "`end` = '" + URLDecoder.decode(request.getParameter("endDate"), "UTF-8") + " " + URLDecoder.decode(request.getParameter("endTime"), "UTF-8") + ":00' "
                            + "WHERE `id` = '" + request.getParameter("id") + "'";
                    stmt.executeUpdate(strSql);
                    HttpSession session = request.getSession();
                    session.setAttribute(("previousDate"), request.getParameter("startDate"));
                    session.setMaxInactiveInterval(5 * 60);
                    response.sendRedirect("ntcbmcp.jsp");
                    break;
                }
                case "delete": {
                    stmt = conn.createStatement();
                    String strSql = "UPDATE `room_events` SET `deleted` = '1' WHERE `id` = '" + request.getParameter("uId") + "'";
                    stmt.executeUpdate(strSql);
                    HttpSession session = request.getSession();
                    session.setAttribute(("previousDate"), request.getParameter("startDate"));
                    session.setMaxInactiveInterval(5 * 60);
                    break;
                }
                case "after": {
                    stmt = conn.createStatement();
                    String strSql = "UPDATE `room_event` SET "
                            + "`memo` = '" + request.getParameter("memo") + "' "
                            + "WHERE `id` = '" + request.getParameter("aId") + "'";
                    stmt.executeUpdate(strSql);
                    HttpSession session = request.getSession();
                    session.setAttribute(("previousDate"), request.getParameter("startDate"));
                    session.setMaxInactiveInterval(5 * 60);
                    response.sendRedirect("ntcbmcp.jsp");
                    break;
                }
            }

        } catch (Exception e) {
            //do nothing
        } finally {
            out.close();
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
                se2.printStackTrace();
            }// nothing we can do
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException se2) {
                se2.printStackTrace();
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }

    }

    private boolean NumToBoolean(int num) {
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    private String SetColorByResource(String id) {
        String color = null;
        switch (id) {
            case "1":
                color = "red";
                break;
            case "2":
                color = "green";
                break;
            case "3":
                color = "blue";
                break;
            case "4":
                color = "purple";
                break;
        }
        return color;
    }

    private String ParameterToSql(HttpServletRequest request, String param) throws Exception {
        String value = URLDecoder.decode(request.getParameter(param), "UTF-8");
        if (value == null || "".equals(value)) {
            return "";
        } else {
            return "`" + param + "` = '" + value + "', ";
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
