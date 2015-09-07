<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : mail
    Created on : May 7, 2015, 2:14:16 PM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email</title>
        <!-- JQuery -->
        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
        <!-- DataTables -->
        <script src="assets/DataTables-1.10.6/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="assets/DataTables-1.10.6/css/jquery.dataTables.min.css">
        <style>
            selectEmail{
                padding:1px;
                border:1px solid green;
            }
        </style>
    </head>
    <body>
    <c:if test="${empty user and empty admin}">
        <script>
            alert("請先登入");
            window.location.href = "floorplan.jsp";
        </script>
    </c:if>
    <jsp:include page="navbar.jsp"></jsp:include>
        <c:import url="GetAllUserAction"></c:import>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <form>

                        <div class="input-group">
                            <div class="input-group-addon">寄件人</div>
                            <input id="fromEmail" name="fromEmail" class="form-control" readonly value="${user.name}">
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">收件人</div>
                            <div id="toEmail">
                                <div id="selectEmail" class="form-inline"></div>
                                <input id="inputEmail" class="form-control">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">主題</div>
                            <input id="subject" name="subject" class="form-control">
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">內容</div>
                            <textarea id="body" name="body" class="form-control"></textarea>
                        </div>
                        <div class="form-inline">
                            <button type="button" class="btn btn-primary form-control" onclick="">發送</button>
                            <button type="button" class="btn btn-default">以其他應用程式發送</button>
                        </div>
                    </form>
                    <a href="mailto:onecooldude@gmail.com?subject=Hey+Dude.+You're+Cool.&cc=anotherdude@gmail.com&bcc=invisibledude@gmail.com">onecooldude@gmail.com</a>
                    <a href="mailto:onecooldude@gmail.com?subject=Hey+Dude.+You're+Cool.&cc=anotherdude@gmail.com,thirddude@gmail.com,fourthdude@gmail.com&bcc=invisibledude@gmail.com,ghost@gmail.com">onecooldude@gmail.com</a>
                    <a href="mailto:onecooldude@gmail.com?subject=Hey+Dude.+You're+Cool.&cc=anotherdude@gmail.com&bcc=invisibledude@gmail.com&body=Your+awesome+message+goes+here.%0D%0A%0D%0AThis+is+on+a+new+line.+Go+to+http%3A%2F%2Fwww.google.com%2F.">onecooldude@gmail.com</a>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <table id="datatable" class="display">
                        <thead>
                            <tr>
                                <td>編號</td>
                                <td>帳號</td>
                                <td>名稱</td>
                                <td>郵件</td>
                            </tr>
                        </thead>
                        <c:forEach var="user" items="${allUsers}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.showName}</td>
                            <td>${user.email}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('table#datatable').DataTable({
                "paging": true,
                "ordering": true,
                "order": [[1, "desc"], [0, "asc"]],
                "processing": true,
                //"serverSide": true, //printing table through jstl, not processing json at server side
                "columnDefs":
                        [
                            {"targets": [0], "visible": true, "searchable": false},
                            {"targets": [1], "visible": true}
                        ],
                "info": true,
                "language": {
                    "sProcessing": "處理中...",
                    "sLengthMenu": "顯示 _MENU_ 項結果",
                    "sZeroRecords": "沒有匹配結果",
                    "sInfo": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "sInfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                    "sInfoFiltered": "(從 _MAX_ 項結果過濾)",
                    "sInfoPostFix": "", "sSearch": "搜索:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "首頁",
                        "sPrevious": "上頁",
                        "sNext": "下頁",
                        "sLast": "尾頁"}
                }
            });
        });
        
        $('table#datatable tbody').on('click', 'tr', function () {
            var text = $('td', this).eq(3).text();
            var div = $('<div>' + text + '</div>', {
                class: "selectEmail"
            });
            div.appendTo($('div#selectEmail'));
            //$('input#uid').val($('td', this).eq(0).text());
        });
        
    </script>
</body>
</html>
