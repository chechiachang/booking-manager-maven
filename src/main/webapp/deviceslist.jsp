<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : floorplan
    Created on : Apr 20, 2015, 11:20:53 AM
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
        <!--
        <link href="assets/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
        -->
        <script src="assets/bootstrap-switch/js/bootstrap-switch.min.js"></script>
        <link rel="stylesheet" href="assets/bootstrap-switch/css/bootstrap-switch.min.css">
        <!-- Font-awesome -->
        <link href="assets/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- JQuery UI -->
        <link href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
        <!-- swiper -->
        <link rel="stylesheet" href="assets/Swiper-3.0.8/dist/css/swiper.min.css">
        <script src="assets/Swiper-3.0.8/dist/js/swiper.min.js"></script>
        <!-- full calendar-->
        <script src='assets/fullcalendar/js/moment.js'></script>
        <script src='assets/fullcalendar/js/fullcalendar.min.js'></script>
        <script src='assets/fullcalendar/js/zh-tw.js'></script>
        <!-- jquery form-validator-->
        <script src="assets/form-validator/jquery.form-validator.min.js"></script>
        <!-- data Table-->
        <script src="assets/DataTables-1.10.6/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="assets/DataTables-1.10.6/css/jquery.dataTables.min.css">
        <!-- Angular JS -->
        <script src="assets/angular-1.4.7/js/angular.min.js"></script>
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">
        <script src="assets/wulian/js/devices.js"></script>

        <link rel="stylesheet" href="assets/wulian/css/devices.css">

        <!-- nhr data -->
        <script src="assets/nhr/js/nhrdata.js"></script>
        <script src="assets/nhr/js/websocket.js"></script>
        <link rel="stylesheet" href="assets/nhr/css/nhr.css">
        <style>


        </style>
    </head>
    <body>    
        <jsp:include page="navbar.jsp"></jsp:include>
        <section>
            <table id="dataTable" class="display" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Address</th>
                        <th>ShortMac</th>
                        <th>Data</th>
                        <th>Data2</th>
                        <th>Voltage</th>
                        <th>Battery</th>
                        <th>Position</th>
                    </tr>
                </thead>
            </table>
        </section>
        <div class="modal fade" id="updateModal" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">編輯使用者</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid"> 
                            <form id="updateForm" method="post" action="EditUserAction">
                                <div class="row">
                                    <input id="id" name="id" hidden>
                                    <div class="input-group">
                                        <div class="input-group-addon">裝置名稱</div>
                                        <input type="text" id="name" name="name" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">裝置種類</div>
                                        <input type="text" id="type" name="type" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">裝置位址</div>
                                        <input type="text" id="address" name="address" class="form-control" readonly>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-addon">裝置短址</div>
                                        <input type="text" id="shortMac" name="shortMac" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">主要資料</div>
                                        <input type="text" id="data" name="data" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">附屬資料</div>
                                        <input type="text" id="data2" name="data2" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">電池電壓</div>
                                        <input type="text" id="voltage" name="voltage" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">電池狀況</div>
                                        <input type="text" id="battery" name="battery" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <div class="input-group-addon">相對位置</div>
                                        <input type="text" id="position" name="position" class="form-control" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="Reset('updateForm')">關閉視窗</button>
                                        <button type="submit" class="btn btn-primary" onclick="EditUser()">送出資料</button>
                                        <button type="button" class="btn btn-default btn-danger" onclick="DeleteUser()">刪除裝置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->  
        <script>
            $(document).ready(function () {
                $.post("NhrDataJsonServlet", {"cmd": "getdata"}, function (response) {
                    var datas = $.parseJSON(response);
                    $('#dataTable').DataTable({
                        data: datas,
                        columns: [
                            {data: 'id'},
                            {data: 'name'},
                            {data: 'type'},
                            {data: 'address'},
                            {data: 'shortMac'},
                            {data: 'data'},
                            {data: 'data2'},
                            {data: 'voltage'},
                            {data: 'battery'},
                            {data: 'position'}
                        ]
                    });
                });
            });

            $('table#datatable tbody').on('click', 'tr', function () {
                $('input#id').val($('td', this).eq(0).text());
                $('div#updateModal').modal();
            });
        </script>
    </body>
</html>

