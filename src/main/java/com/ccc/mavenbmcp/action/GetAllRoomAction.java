/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ccc.mavenbmcp.action;

import com.ccc.mavenbmcp.entity.JdbcConnBmcp;
import com.ccc.mavenbmcp.entity.Room;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name="GetAllRoomAction", urlPatterns = {"/GetAllRoomAction"})
public class GetAllRoomAction extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html");

            Connection conn = null;
            Statement stmt = null;
            PreparedStatement ps = null;
            ResultSet rs;
            try {
                 Class.forName(JdbcConnBmcp.getDRIVER_MANAGER());
                conn = DriverManager.getConnection(JdbcConnBmcp.getDB_URL(), JdbcConnBmcp.getUSER(), JdbcConnBmcp.getPASS());
                
                stmt = conn.createStatement();

                String strSql = "SELECT `id`, `roomId`, `name`, `class_id`, `text`, `uri`,`color`, `fontSize`, `top`, `left`, `height`, `width` FROM `rooms`";
                rs = stmt.executeQuery(strSql);
                List<Room> rooms = new ArrayList<>();
                while (rs.next()) {
                    Room room = new Room();

                    room.setId(rs.getInt("id"));
                    room.setRoomId(rs.getInt("roomId"));
                    room.setName(rs.getString("name"));
                    room.setClass_id(rs.getInt("class_id"));
                    room.setText(rs.getString("text"));
                    room.setUri(rs.getString("uri"));
                    room.setColor(rs.getString("color"));
                    room.setFontSize(rs.getString("fontSize"));
                    room.setTop(rs.getInt("top"));
                    room.setLeft(rs.getInt("left"));
                    room.setHeight(rs.getInt("height"));
                    room.setWidth(rs.getInt("width"));
                    rooms.add(room);

                    //out.write(room.getId() + room.getName() + room.getClass_id() + room.getText() + room.getUri() + room.getTop() + room.getLeft() + room.getHeight() + room.getWidth() + "<br/>");
                }

                HttpSession session = request.getSession();
                session.setAttribute("rooms", rooms);
                session.setMaxInactiveInterval(5 * 60);

            } catch (Exception e) {

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
                    if (ps != null) {
                        ps.close();
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
