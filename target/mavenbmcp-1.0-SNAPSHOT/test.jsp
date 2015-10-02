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
        <script src="assets/nhr/js/websocket.js"></script>
    </head>
    <body>
        <div id="output"></div>
    </body>
</html>
