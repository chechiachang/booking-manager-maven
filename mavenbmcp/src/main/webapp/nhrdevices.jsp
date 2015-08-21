<%-- 
    Document   : nhrdevices
    Created on : Aug 21, 2015, 11:40:18 AM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>平面圖</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--jquery-->
        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <link href="assets/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
        <!-- Font-awesome -->
        <link href="assets/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- JQuery UI -->
        <link href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
        <!-- swiper -->
        <link rel="stylesheet" href="assets/Swiper-3.0.8/dist/css/swiper.min.css">
        <script src="assets/Swiper-3.0.8/dist/js/swiper.min.js"></script>
        <!-- full calendar-->
        <script src='js/moment.js'></script>
        <script src='js/fullcalendar.min.js'></script>
        <script src='js/zh-tw.js'></script>
        <!-- jquery form-validator-->
        <script src="js/form-validator/jquery.form-validator.min.js"></script>
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">

        <link rel="stylesheet" href="css/devices.css">
        <script src="assets/nhr/js/nhrdata.js"></script>
        <link rel="stylesheet" href="assets/nhr/css/devices.css">
        <script>

        </script>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>

        <div class="container">
            <div class="col-lg-12">
                <h1>Nhr Devices</h1>
            </div>
            <div class="col-lg-10">
                <div id="floor1">

                </div>
            </div><!--col-lg-10-->
            <div class="col-lg-2">

            </div><!--col-lg-2-->
        </div><!--container-->

    </body>
</html>

