<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : navbar
    Created on : Apr 27, 2015, 8:41:11 AM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            a.navbar-brand{
                font-size: 1.5em;
            }
            li a{
                font-size: 1.2em;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" target="_blank">Space Manage System</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="floorplan.jsp">Floorplan</a><span class="sr-only">(current)</span></li>
                        <li><a href="table.jsp">Table<span class="sr-only">(current)</span></a></li>
                        <li><a href="users.jsp">Users<span class="sr-only">(current)</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Devices<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="devices.jsp">Wulian</a></li>
                                <li><a href="nhrdevices.jsp">NHR</a></li>
                            </ul>
                        </li>
                        <li><a href="mail.jsp">Mail<span class="sr-only">(current)</span></a></li>
                        <li><a href="signage.jsp">Signage</a><span class="sr-only">(current)</span></li>
                        <li><a href="dvr.jsp">IPCam</a></li>
                    </ul>

                    <c:choose>                        
                        <c:when test="${not empty user}">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">會員功能<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="GetUserInfoAction?name=${user}">個人設定</a></li>
                                        <li><a href="LogoutServlet">帳號登出</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <label class="navbar-text navbar-right">歡迎<input id="loginuser" value="${user}"></label>
                            </c:when>
                            <c:when test="${not empty admin}">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">管理員功能<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="users.jsp">使用者管理</a></li>
                                        <li><a href="rooms.jsp">空間管理</a></li>
                                        <li><a href="events.jsp">事件管理</a></li>
                                        <li><a href="devicessetup.jsp">裝置管理</a></li>
                                        <li class="divider"></li>
                                        <li><a href="GetUserInfoAction?name=${admin}">個人設定</a></li>
                                        <li><a href="LogoutServlet">帳號登出</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <label class="navbar-text navbar-right">歡迎<input id="loginuser" value="${admin}"></label>
                            <input id="isAdmin" value="true" hidden>
                        </c:when>
                        <c:otherwise>
                            <form class="navbar-form navbar-right" action="LoginServlet" method="post">
                                <label for="name">帳號</label>
                                <input id="name" name="name" value="username">
                                <label for="password">密碼</label>
                                <input type="password" id="password" name="password" value="username">
                                <button class="btn btn-default" type="submit">登入</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </body>
</html>
