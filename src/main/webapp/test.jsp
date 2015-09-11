<%-- 
    Document   : test
    Created on : Jul 17, 2015, 3:37:49 PM
    Author     : davidchang
--%>

<%@page import="com.ccc.ntcbmcp.entity.NtcEvent"%>
<%@page import="com.ccc.mavenbmcp.entity.JdbcConnBmcp"%>
<%@page import="com.ccc.mavenbmcp.entity.JdbcConnNhr"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ccc.nhrservlet.NhrData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.ccc.util.XmlMapping"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            /* TODO output your page here. You may use following sample code. */
            Connection conn = null;
            Statement stmt = null;
            PreparedStatement pstmt = null;
            ResultSet rs;
            Class.forName(JdbcConnBmcp.getDRIVER_MANAGER());
            conn = DriverManager.getConnection(JdbcConnBmcp.getDB_URL(), JdbcConnBmcp.getUSER(), JdbcConnBmcp.getPASS());

            String cmd = request.getParameter("cmd");
            String date = "2015-09-11";
            pstmt = conn.prepareStatement("SELECT t1.`id`, t1.`roomId`, t2.`name`, `start`, `end` "
                    + "FROM `room_events` AS t1 Left JOIN `rooms` AS t2 "
                    + "ON t1.`roomId` = t2.`roomId` "
                    + "WHERE `deleted` != '1' AND `start` > ? AND `start` < ? "
                    + "ORDER BY `id`");
            //end > `start` > date 
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
               

                list.add(ntcevent);
            }
            rs.close();
            String json = new Gson().toJson(list);
            response.setContentType("application/json");
            response.setContentType("text/html;charset=UTF-8");
            out.write(json);


        %>
    </body>
</html>
