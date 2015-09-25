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
            Class.forName(JdbcConnNhr.getDRIVER_MANAGER());
            conn = DriverManager.getConnection(JdbcConnNhr.getDB_URL(), JdbcConnNhr.getUSER(), JdbcConnNhr.getPASS());

            String cmd = "getdata";
            switch (cmd) {
                case "getdata":
                    stmt = conn.createStatement();
                    String strSql = "SELECT `type`, `address`, `short_mac`, `cluster_id`, `data`, `data2`, `position` From `data`";
                    rs = stmt.executeQuery(strSql);

                    List list = new ArrayList<>();

                    while (rs.next()) {
                        NhrData nhrData = new NhrData();
                        nhrData.setType(rs.getString("type"));
                        nhrData.setAddress(rs.getString("address"));
                        nhrData.setShortMac(rs.getString("short_mac"));
                        nhrData.setClusterId(rs.getString("cluster_id"));
                        nhrData.setData(rs.getString("data"));
                        nhrData.setData2(rs.getString("data2"));
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


        %>
    </body>
</html>
