<%-- 
    Document   : newpage
    Created on : Sep 9, 2015, 10:12:04 AM
    Author     : davidchang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>環境資訊顯示看板</title>

        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Optional theme -->
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled and minified JavaScript -->
        <link href="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js" rel="stylesheet" type="text/css"/>
        <!-- Font-awesome -->
        <link href="assets/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- JQuery UI -->
        <link href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/jquery-ui-1.11.4.custom/jquery-ui.min.js" type="text/javascript"></script>
        <!-- owl-carousel-->
        <script src="assets/owl-carousel/owl.carousel.min.js"></script>
        <link href="assets/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="assets/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css"/>
        <link href="assets/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css"/>

        <script src="assets/bulletin/bulletin.js"></script>
        <link rel="stylesheet" href="assets/bulletin/bulletin.css">

        <style>
            body{
                background-image: url('images/bulletin/bulletinbg1.jpg');
                background-size:cover;
            }
        </style>
        <script>
            $(function () {
                
                $("div#carousel").owlCarousel({
                    pagination: false,
                    slideSpeed: 10,
                    singleItem: true,
                    autoPlay: 5000,
                    transitionStyle: "fade"
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <c:import url="GetRoomInfoAction"></c:import>
            <div class="container">
                <div class="row">
                    <h1>環境資訊顯示看板</h1>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 col-lg-offset-1">
                        <input class="bulletin-input form-control yellow" id="date">
                        <input class="bulletin-input form-control yellow" id="weekDay">
                        <input class="bulletin-input form-control yellow" id="time">
                        <div id="carousel" class="owl-carousel">
                            <div class="message-box">
                                <p>系統連線中</p>
                            </div>
                            <div class="message-box">
                                <p>裝置正常</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                        <div class="input-group has-warning">
                            <div class="input-group-addon">室內溫度</div>
                            <input class="bulletin-input form-control measure" id="temp" value="${bulletin.temp}">
                        <div class="input-group-addon">℃</div>
                    </div>
                        
                    <div class="input-group has-success">
                        <div class="input-group-addon">二氧化碳</div>
                        <input class="bulletin-input form-control measure" id="CO2" value="${bulletin.CO2}">
                        <div class="input-group-addon">ppm</div>
                    </div>
                    <div id='pbarCO2' style="height: 20px;"></div>
                    <input class="form-control comfort" id="CO2Comfort" placeholder="計算中">

                    <div class="input-group has-error">
                        <div class="input-group-addon">相對濕度</div>
                        <input class="bulletin-input form-control measure" id="humid" value="${bulletin.humid}">
                        <div class="input-group-addon">％</div>
                    </div>
                    <div id='pbarHumid' style="height: 20px;"></div>
                    <input class="bulletin-input form-control comfort" id="humidComfort" placeholder="計算中">

                </div>
            </div><!--row-->
        </div><!--container-->
    </body>
</html>
