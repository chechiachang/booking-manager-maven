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

        <script src="assets/bulletin/bulletin2.js"></script>

        <style>
            body{
                background-image: url('images/bulletin/sun-for-5am-4pm.jpg');
                background-size:cover;
                color:white;
                text-align: center;
                alignment-adjust: middle;
            }
            .main-frame{
                border-width: 1em;
                border-radius: 2em;
                background-color: rgba(0,0,0,0.5);
            }
            input{
                background:none;
                text-align: center;
                alignment-adjust: middle;
                border:none;
                width:100%;
            }
            //time
            p#fullYear{
                //padding-top:10px;
                font-size:4em;
            }
            .date{
                font-size:5em;
                text-align: center;
                alignment-adjust: middle;
            }
            p#weekDay{
                padding-top:20px;
                font-size:2em;
            }
            .time{
                font-size:5em;
                text-align: center;
                alignment-adjust: middle;
            }
            //meausre
            .measure{
                color:yellow;
            }
            p#title-temp{
                padding-top:20px;
                font-size:3em;
                text-align: center;
                alignment-adjust: middle;
            }
            input#temp{
                width:70%;
                font-size:5em;
            }
            p#title-humid{
                padding-top:10px;
                font-size:2em;
                text-align: center;
                alignment-adjust: middle;
            }
            input#CO2{
                width:70%;
                font-size:4em;
            }
            p#title-CO2{
                padding-top:10px;
                font-size:2em;
                text-align: center;
                alignment-adjust: middle;
            }
            input#humid{
                width:70%;
                font-size:4em;
            }
            //image

            //carousel
            .message-box{
                font-size:2em;
            }
            .img-container{
                min-height: 100px;
                text-align: center;
                alignment-adjust: middle;
            }
        </style>
        <script>
            $(function () {
                $("div#carousel").owlCarousel({
                    pagination: false,
                    slideSpeed: 10,
                    singleItem: true,
                    autoPlay: 5000,
                    rewindSpeed: 1
                            //transitionStyle: "fade"
                });
            });
        </script>
    </head>
    <body>
        <c:import url="GetRoomInfoAction"></c:import>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3 main-frame">
                        <div class="row">
                            <div class="col-lg-5">
                                <p id="fullYear" style="font-size:1.5em;padding-top:1em;"></p>
                                <input class="date" id="date" readonly>
                            </div>
                            <div class="col-lg-1">
                                <p id="weekDay"></p>
                            </div>
                            <div class="col-lg-6">
                                <p id="title-temp" style="font-size:1.5em;padding-top:1em;">室內溫度</p>
                                <input class="measure" id="temp" value="${bulletin.temp}" style="color:yellow;" readonly><label for="temp">℃</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <input class="time" id="time" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="col-lg-12">
                                <p id="title-CO2">空氣品質</p>
                            </div>
                            <div class="col-lg-12 input-group">
                                <input class="measure" id="CO2" value="${bulletin.CO2}" style="color:yellow;" readonly>
                                <label for="CO2">ppm</label>
                            </div>
                        </div>
                        <div class="col-lg-2 img-container">
                            <div>
                                <img class="img-small" src="images/bulletin/small-cloud-left.gif" alt="" style="height:10px;float:left;">
                                <img class="img-small" src="images/bulletin/small-cloud-left.gif" alt="" style="height:15px;float:left;padding-left:10px;">
                                <img class="img-small" src="images/bulletin/small-cloud-left.gif" alt="" style="height:10px;float:right;">
                            </div>
                            <img id="img-cloud" class="img-main" src="" alt="" style="height:50px;">
                        </div>
                        <div class="col-lg-4">
                            <div class="col-lg-12">
                                <p id="title-humid">相對濕度</p>
                            </div>                            
                            <div class="input-group col-lg-12">
                                <input class="measure" id="humid" value="${bulletin.humid}" style="color:yellow;" readonly>
                                <label for="humid">%</label>
                            </div>
                        </div>
                        <div class="col-lg-2 img-container">
                            <div>
                                <img class="img-small" src="images/bulletin/small-water.gif" alt="" style="height:10px;float:left;">
                                <img class="img-small" src="images/bulletin/small-water.gif" alt="" style="height:15px;float:left;padding-left:10px;">
                                <img class="img-small" src="images/bulletin/small-water.gif" alt="" style="height:10px;float:right;">
                            </div>
                            <img id="img-humid" class="img-main" src="" alt="" style="height:50px;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="carousel" class="owl-carousel" style="background-color:rgba(225,225,225,0.5);border-radius:2em;margin-bottom:1em;font-size:2em;">
                                <div class="message-box">
                                    <p>系統連線中</p>
                                    <p>裝置正常</p>
                                </div>
                                <div class="message-box">
                                    <p>新聞一</p>
                                    <p>Yahoo奇摩新聞</p>
                                </div>
                                <div class="message-box">
                                    <p>新聞二</p>
                                    <p>Google新聞</p>
                                </div>
                                <div class="message-box">
                                    <p>新聞三</p>
                                    <p>BBC NEWS</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--row-->
        </div><!--container-->
    </body>
</html>
