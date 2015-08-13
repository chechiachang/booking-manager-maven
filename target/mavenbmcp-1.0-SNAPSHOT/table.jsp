<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : table
    Created on : Apr 23, 2015, 4:43:40 PM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>報表</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-1.11.2.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- JQuery UI -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <script src="js/jquery-ui.min.js"></script>
        <!-- full calendar-->
        <script src='js/moment.js'></script>
        <script src='js/fullcalendar.min.js'></script>
        <script src='js/zh-tw.js'></script>
        <!-- jAlert-->
        <script src="js/jAlert-v2-min.js"></script>
        <link rel="stylesheet" href="css/jAlert-v2-min.css">
        <!-- swiper -->
        <link rel="stylesheet" href="css/swiper.min.css">
        <script src="js/swiper.min.js"></script>
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">
        <link rel='stylesheet' href='css/fullcalendar.min.css'>
        <!-- DataTables-->
        <script src="js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">

    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <section>
            <c:import url="/GetAllRoomEvent" ></c:import>
                <div class="container-fluid">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table id="datatable" class="display">
                            <thead>
                                <tr>
                                    <td>流水號</td>
                                    <td>房間編號</td>
                                    <td>會議名稱</td>
                                    <td>刪除</td>
                                    <td>開始時間</td>
                                    <td>結束時間</td>
                                    <td>登記使用者</td>
                                    <td>編輯紀錄</td>
                                    <td>事後紀錄</td>
                                    <td>連結網址</td>
                                </tr>
                            </thead>
                        <c:forEach var="event" items="${roomEvents}">
                            <tr>
                                <td>${event.id}</td>
                                <td>${event.roomId}</td>
                                <td>${event.title}</td>
                                <td>${event.deleted}</td>
                                <td>${event.start}</td>
                                <td>${event.end}</td>
                                <td>${event.createdBy}</td>
                                <td>${event.modifiedBy}</td>
                                <td>${event.memo}</td>
                                <td>${event.url}</td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </section>
        <script>
            $(document).ready(function () {
                $('table#datatable').DataTable({
                    "paging": true,
                    "ordering": true,
                    "order": [[1, "asc"], [2, "asc"]],
                    "processing": true,
                    //"serverSide": true, //printing table through jstl, not processing json at server side
                    "columnDefs":
                            [
                                {"targets": [0], "visible": true, "searchable": false},
                                {"targets": [1], "visible": true}
                            ],
                    "info": true,
                    "language": {
                        "lengthMenu": "每頁顯示 _MENU_ 比資料",
                        "zeroRecords": "抱歉 - 查無資料",
                        "info": "顯示頁數 _PAGE_ / _PAGES_",
                        "infoEmpty": "無資料",
                        "infoFiltered": "(filtered from _MAX_ total records)"
                    }
                });
            });
            $('table#datatable tbody').on('click', 'tr', function () {
                var name = $('td', this).eq(0).text();
                //alert('You clicked on ' + name + '\'s row');
            });
        </script>
    </body>
</html>
