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

        <!--JQuery-->
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
        <!-- swiper -->
        <link rel="stylesheet" href="assets/Swiper-3.0.8/dist/css/swiper.min.css">
        <script src="assets/Swiper-3.0.8/dist/js/swiper.min.js"></script>
        <!-- full calendar-->
        <script src='js/moment.js'></script>
        <script src='js/fullcalendar.min.js'></script>
        <script src='js/zh-tw.js'></script>
        <link rel='stylesheet' href='css/fullcalendar.min.css'>
        <!-- jAlert-->
        <script src="js/jAlert-v2-min.js"></script>
        <link rel="stylesheet" href="css/jAlert-v2-min.css">
        <!-- jquery form-validator-->
        <script src="js/form-validator/jquery.form-validator.min.js"></script>

        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">
        <script src="js/smartfloorplan.js"></script>
        <link rel="stylesheet" href="css/devices.css">

        <style>

            .floorplan-title{
                position:absolute;
                top:10px;
                left:10px;
            }
            .swiper-pagination-bullet {
                width: 20px;
                height: 20px;
                text-align: center;
                line-height: 20px;
                font-size: 12px;
                color:#000;
                opacity: 1;
                background: rgba(0,0,0,0.2);
            }
            .swiper-pagination-bullet-active {
                color:#fff;
                background: #007aff;
            }
            div img.wide {
                max-width: 100%;
                max-height: 100%;
                width:100%;
                height: auto;
            }
            div img.tall {
                max-height: 100%;
                max-width: 100%;
                height:100%;
                width: auto;
            }​
            html{
                overflow-y: hidden;
            }
            .swiper-pagination-bullet {
                width: 20px;
                height: 20px;
                text-align: center;
                line-height: 20px;
                font-size: 12px;
                color:#000;
                opacity: 1;
                background-color: rgba(0,0,0,0.2);
            }
            .swiper-pagination-bullet-active {
                color:#fff;
                background: #007aff;
            }
            div img.wide {
                max-width: 100%;
                max-height: 100%;
                width:100%;
                height: auto;
            }
            div img.tall {
                max-height: 100%;
                max-width: 100%;
                height:100%;
                width: auto;
            }​


        </style>
    </head>
    <body>        

        <jsp:include page="navbar.jsp"></jsp:include>

            <section>
            <c:import url="GetAllFloorAction"></c:import>
            <c:import url="GetAllRoomAction"></c:import>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-10">
                            <!--
                            <ul class="nav nav-pills" role="tablist">
                        <c:forEach var="floor" items="${floors}">
                            <li role="presentation" class=""><a name="floorNav-${floor.id}" href="#" >${floor.name}<span class="badge"></span></a></li>
                        </c:forEach>
            </ul>
                        -->
                        <!-- Swiper -->
                        <div class="swiper-container swiper-container-v">
                            <div class="swiper-wrapper">
                                <!-- create horizontal swiper by floor-->
                                <c:forEach var="floor" items="${floors}">
                                    <div class="swiper-slide">
                                        <div class="swiper-container swiper-container-h">
                                            <div id="swiper-wrapper" class="swiper-wrapper">
                                                <!-- create floor slide -->
                                                <div id="floor${floor.id}" class="swiper-slide">
                                                    <img class="floorplan" src="${floor.imageUri}" alt="#"/>
                                                    <div class="floorplan-title" >
                                                        <h1>${floor.name}</h1>
                                                    </div>
                                                    <!-- put room div into floor slide -->
                                                </div>
                                                <!-- create room slide -->
                                            </div>
                                            <!--
                                    <div class="swiper-pagination swiper-pagination-h"></div>                    
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-button-next"></div>
                                            -->
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination swiper-pagination-v"></div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <table id="device_table" class="table table-condensed">
                            <tbody>
                                <tr><td><i class="fa fa-bell"></i></td><td>移動感測</td></tr><!--2-->
                                <tr><td>&nbsp;<i class="fa fa-lock"></i></td><td>門磁感應</td></tr><!--3-->
                                <tr><td><i class="fa fa-sliders"></i></td><td>調光開關</td></tr><!--12-->
                                <tr><td><i class="fa fa-plug"></i></td><td>計量插座</td></tr><!--15-->
                                <tr><td><i class="fa fa-gear"></i></td><td>溫溼度計</td></tr><!--17-->
                                <tr><td><i class="fa fa-spinner"></i></td><td>光度感應</td></tr><!--19-->
                                <tr><td><i class="fa entypo-signal"></i></td><td>紅外轉發</td></tr><!--22-->
                                <tr><td><i class="fa fa-cloud"></i></td><td>CO2感測</td></tr><!--42-->
                                <tr><td>&nbsp;<i class="fa fa-bolt"></i></td><td>單鍵插座</td></tr><!--50-->
                                <tr><td><i class="fa fa-link"></i></td><td>雙切綁定開關</td></tr><!--54-->
                                <tr><td><i class="fa entypo-adjust"></i></td><td>單切開關</td></tr><!--61-->
                                <tr><td>&nbsp;<i class="fa entypo-flow-parallel fa-rotate-90"></i></td><td>雙切開關</td></tr><!--62-->
                                <tr><td><i class="fa entypo-flow-tree fa-rotate-270"></i></td><td>三切開關</td></tr><!--63-->
                                <tr><td><i class="fa fa-unsorted"></i></td><td>窗簾控制</td></tr><!--65-->
                                <tr><td><i class="fa fa-key"></i></td><td>四代門鎖</td></tr><!--70 -->
                                <tr><td><i class="fa fa-video-camera"></i></td><td>IP Cam</td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <jsp:include page="modal.jsp"></jsp:include>
        </section>
        <script>

            $(function () {

                //calendar
                //page initialize
                IsAdmin();

                $('select#repeatSelect').change(function () {
                    SetRepeatUntilDatepicker();
                });

                InitialFullCalendar(201);

                $('div').find('img[name="roomimg"]').each(function () {
                    var imgClass = (this.width / this.height > 1) ? 'wide' : 'tall';
                    $(this).addClass(imgClass);
                });
                $('a[name="floorNav-1"]').parent('li').addClass("active");

            }); //$(function(){}

            $('form').bind('ajax:complete', function () {
                // tasks to do 
                $('div#oneDayCalendar').fullCalendar('refetchEvents');
            });

            /*
             var mySwiper = new Swiper('.swiper-container', {
             // Optional parameters
             direction: 'horizontal',
             speed: 500,
             //control
             mousewheelControl: true,
             loop: true,
             //Grab Cursor
             grabCursor: true,
             //Touches
             threshold: 10,
             // Navigation arrows                          
             nextButton: '.swiper-button-next',
             prevButton: '.swiper-button-prev',
             // And if we need scrollbar
             scrollbar: '.swiper-scrollbar'
             });
             */
            var swiperH = new Swiper('.swiper-container-h', {
                pagination: '.swiper-pagination-h',
                paginationClickable: true,
                paginationBulletRender: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + '</span>';
                },
                spaceBetween: 50
            });
            var swiperV = new Swiper('.swiper-container-v', {
                pagination: '.swiper-pagination-v',
                paginationClickable: true,
                paginationBulletRender: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + 'F</span>';
                },
                direction: 'vertical',
                spaceBetween: 50,
                nextButton: '.swiper-button-next',
                prevButton: '.swiper-button-prev'
            });

            $('a[name*="floorNav"]').click(function () {
                var floor_id = parseInt(this.name.split("-")[1]) - 1;//int 1 or 11
                swiperV.slideTo(floor_id, 1000, true);
                //swiperH.slideTo(0, 1000, true);
                //remove active and make parant li active
                $('li[class|="active"]').removeClass("active");
                $(this).parent('li').addClass("active");
            });
            $('a[name*="roomNav"]').click(function () {
                var roomId = this.name.split("-")[1]; //string 105
                var idInFloor = parseInt(roomId.slice(-2)); //int 5
                swiperH.slideTo(idInFloor, 1000, true);
                //remove active and make parant li active
                $('li[class|="active"]').removeClass("active");
                $(this).parent('li').addClass("active");
            });
            function SwipeToRoom(roomId) {
                //remove active and make parant li active
                var intRoomId = parseInt(roomId.toString().slice(-2)); //1
                $('li[class|="active"]').removeClass("active");
                $('ul li:nth-child(' + (intRoomId + 1) + ')').addClass("active");
                swiperH.slideTo(intRoomId);
            }

            swiperH.on('slideChangeStart', function (swiper) {
                console.log(swiper.activeIndex);
                $('li[class|="active"]').removeClass("active");
                $('ul li:nth-child(' + (swiper.activeIndex + 1) + ')').addClass("active");
            });


            function InitialFullCalendar(roomId) {
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
                $('div#oneDayCalendar').fullCalendar({
                    height: 'auto',
                    lang: 'zh-tw',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    columnFormat: 'ddd M/D',
                    defaultView: 'agendaWeek',
                    timezone: 'local',
                    businessHour: {
                        start: '09:00', // a start time (10am in this example)
                        end: '18:00', // an end time (6pm in this example)
                        dow: [1, 2, 3, 4, 5]
                                // days of week. an array of zero-based day of week integers (0=Sunday)
                                // (Monday-Thursday in this example)
                    },
                    events: 'RoomEventJsonServlet?cmd=room&roomId=' + roomId,
                    allDaySlot: false,
                    //event options
                    selectable: true,
                    selectOverlap: false,
                    startEditable: true,
                    eventStartEditable: true,
                    eventOverlap: false,
                    droppable: true,
                    minTime: "09:00:00",
                    maxTime: "19:00:00",
                    duration: "01:00:00",
                    //selectable
                    selectHelper: true,
                    //select: create event
                    select: function (start, end) {
                        if (!SelectTimeValidate(start)) {
                            $('#oneDayCalendar').fullCalendar('unselect');
                            alert("無法登記以前的時間");
                        } else if (!LoginValidate()) {
                            $('#oneDayCalendar').fullCalendar('unselect');
                            alert("請先登入");
                        } else {
                            //set createdBy = login user  

                            $('input#roomId').val($('input#thisroomid').val());
                            $('input#createdBy').val($('input#loginuser').val());
                            SetDatepicker($('input#startDatepicker'), start);
                            SetDatepicker($('input#endDatepicker'), start);
                            initLoadTimeSelect($('select#startTimeSelect'));
                            initLoadTimeSelect($('select#endTimeSelect'));
                            SetRepeatUntilDatepicker();
                            SetTimeSelect($('select#startTimeSelect'), start);
                            SetTimeSelect($('select#endTimeSelect'), end);
                            //initLoadObjectSelect($('select#objectSelect'));
                            $('div#insertModal').modal({
                            });
                        }
                    },
                    //dayclick unavailable
                    dayClick: function (date, jsEvent, view) {
                        if (LoginValidate()) {
                            $('p#day').html('Clicked on: ' + date.format() + "\n"
                                    + 'Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY + "\n"
                                    + 'Current view: ' + view.name);
                        } else {
                            //alert("請先登入");
                        }
                    },
                    eventClick: function (event, jsEvent, view) {
                        //eventClick: edit event
                        if (!LoginValidate()) {
                            alert("請先登入");
                        } else if (!Authorize(event)) {
                            alert("無更改權限");
                        } else {
                            //alert("id:" + event.id);
                            //edit ias allowed before event start
                            //event launcher or administrator can access
                            if (date < event.start) {
                                $('input#uId').val(event.id);
                                $('input#utitle').val(event.title);
                                $('input#udescription').val(event.description);
                                $('input#uroomId').val($('input#thisroomid').val());
                                $('input#modifiedBy').val($('input#loginuser').val());
                                SetDatepicker($('input#ustartDatepicker'), event.start);
                                SetDatepicker($('input#uendDatepicker'), event.end);
                                initLoadTimeSelect($('select#ustartTimeSelect'));
                                initLoadTimeSelect($('select#uendTimeSelect'));
                                SetRepeatUntilDatepicker();
                                SetTimeSelect($('select#ustartTimeSelect'), event.start);
                                SetTimeSelect($('select#uendTimeSelect'), event.end);
                                $('div#updateBeforeModal').modal({
                                });
                                //edit is limited only to memo after event start
                            } else {
                                $('input#aId').val(event.id);
                                $('input#atitle').val(event.title);
                                $('input#adescription').val(event.description);
                                $('input#aroomId').val($('input#thisroomid').val());
                                $('input#acreatedBy').val(event.createdBy);
                                $('input#memo').val(event.memo);
                                SetDatepicker($('input#astartDatepicker'), event.start);
                                SetDatepicker($('input#aendDatepicker'), event.end);
                                $('input#astartDatepicker').datepicker("option", "disabled", true);
                                $('input#aendDatepicker').datepicker("option", "disabled", true);
                                initLoadTimeSelect($('select#astartTimeSelect'));
                                initLoadTimeSelect($('select#aendTimeSelect'));
                                SetRepeatUntilDatepicker();
                                SetTimeSelect($('select#astartTimeSelect'), event.start);
                                SetTimeSelect($('select#aendTimeSelect'), event.end);
                                $('div#updateAfterModal').modal({
                                });
                            }
                        }
                    },
                    //drag
                    //drop
                    eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
                        revertFunc();
                        /*
                         alert(
                         'id: ' + event.id +
                         'start: ' + event.start +
                         'end: ' + event.end +
                         'resources: ' + event.resources
                         );
                         if (!confirm("Are you sure about this change?")) {
                         revertFunc();
                         }
                         */
                    },
                    //eventResize
                    editable: true,
                    eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
                        revertFunc();
                        /*
                         alert(event.title + " end is now " + event.end.format());
                         if (confirm("is this okay?")) {
                         $.post('/RoomEventJsonServlet', {cmd: "resize", id: event.id, start: event.start, end: event.end});
                         } else {
                         revertFunc();
                         }
                         */

                    }
                });
            }

            /*use jquery-ui instead
             mySwiper.on('onTouchStart', function (mySwiper, e) {
             var parentOffset = $('div#swiper-wrapper').parent().offset();
             var initX = e.pageX - parentOffset.left;
             var initY = e.pageY - parentOffset.top;
             $('span#span3').text("initX:" + initX);
             $('span#span4').text("initY:" + initY);
             });
             mySwiper.on('onTouchMove', function (mySwiper, e) {
             var parentOffset = $('div#swiper-wrapper').parent().offset();
             var currentX = e.pageX - parentOffset.left;
             var currentY = e.pageY - parentOffset.top;
             $('span#span5').text("currentX:" + currentX);
             $('span#span6').text("currentY:" + currentY);
             });
             mySwiper.on('onTouchEnd', function (mySwiper, e) {
             var parentOffset = $('div#swiper-wrapper').parent().offset();
             var endX = e.pageX - parentOffset.left;
             var endY = e.pageY - parentOffset.top;
             $('span#span7').text("endX:" + endX);
             $('span#span8').text("endY:" + endY);
             });
             */




            /*
             $("div").mousemove(function (event) {
             var pageCoords = "( " + event.pageX + ", " + event.pageY + " )";
             var clientCoords = "( " + event.clientX + ", " + event.clientY + " )";
             $("span:first").text("( event.pageX, event.pageY ) : " + pageCoords);
             $("span:last").text("( event.clientX, event.clientY ) : " + clientCoords);
             });
             */
            /*
             var isDragging = false;
             var initX = 0;
             var initY = 0;
             var endX = 0;
             var endY = 0;
             $('div#swiper-wrapper')
             .mousedown(function (e) {
             $(window).mousemove(function () {
             var parentOffset = $('div#swiper-wrapper').parent().offset();
             initX = e.pageX - parentOffset.left;
             initY = e.pageY - parentOffset.top;
             $('span#span3').text("initX:" + initX);
             $('span#span4').text("initY:" + initY);
             idDragging = true;
             $(window).unbind("mousemove");
             });
             })
             .mouseup(function (e) {
             var wasDragging = isDragging;
             var parentOffset = $('div#swiper-wrapper').parent().offset();
             endX = e.pageX - parentOffset.left;
             endY = e.pageY - parentOffset.top;
             $('span#span5').text("endX:" + endX);
             $('span#span6').text("endY:" + endY);
             isDragging = false;
             $(window).unbind("mousemove");
             if (!wasDragging) {//was clicking
             $('div#swiper-wrapper').click();
             }
             });
             */
            function initLoadTimeSelect(target) {
                target.find('option').remove();
                for (var i = 9; i < 19; i++) {
                    if (i < 10) {
                        $('<option>').val("0" + i + ":00").text("0" + i + ":00").appendTo(target);
                        $('<option>').val("0" + i + ":30").text("0" + i + ":30").appendTo(target);
                    } else {
                        $('<option>').val(i + ":00").text(i + ":00").appendTo(target);
                        $('<option>').val(i + ":30").text(i + ":30").appendTo(target);
                    }
                }
                $('<option>').val("19:00").text("19:00").appendTo(target);
            }

            /*
             function initLoadObjectSelect(target) {
             $.get('/RoomEventJsonServlet', {cmd: "objects"}, function (jsonResponse) {
             target.find('option').remove();
             var json = JSON.parse(jsonResponse);
             for (var i = 0; i < json.length; i++) {
             $('<option>').val(json[i].id).text(json[i].name).appendTo(target);
             }
             });
             }
             */
            function SetDatepicker(target, date) {
                var tDate = new Date(date);
                target.datepicker({dateFormat: 'yy/mm/dd'});
                target.datepicker("setDate", tDate);
            }

            function SetRepeatUntilDatepicker() {
                var date = new Date();
                var target = $('input#repeatUntilDatepicker');
                target.datepicker({dateFormat: 'yy/mm/dd'});
                target.datepicker("setDate", date);
                switch ($('select#repeatSelect').val()) {
                    case "no":
                        target.datepicker("setDate", date);
                        break;
                    case "everyday":
                        date.setDate(date.getDate() + 1);
                        target.datepicker("setDate", date);
                        break;
                    case "everyweek":
                        date.setDate(date.getDate() + 7);
                        target.datepicker("setDate", date);
                        break;
                    case "everyMonth":
                        date.setMonth(date.getMonth() + 1);
                        target.datepicker("setDate", date);
                        break;
                }
            }

            function SetTimeSelect(target, time) {
                if (time.hour() < 10) {
                    target.val("0" + time.hour() + ":" + ((time.minute() == 0) ? "00" : time.minute()));
                } else {
                    target.val(time.hour() + ":" + ((time.minute() == 0) ? "00" : time.minute()));
                }
            }

            function IsAdmin() {
                $.post("UserServlet", {cmd: "isAdmin", name: $('input#loginuser').val()}, function (jsonResponse) {
                    //return [] or ["true"]
                    if (jsonResponse.length > 3) {
                        $('input#isAdmin').val(true);
                    } else {
                        $('input#isAdmin').val(false);
                    }
                });
            }

            function Authorize(event) {
                //administrator 
                //非登記人無法更改
                if ($('input#isAdmin').val() == "true") {
                    return true;
                } else if ($('input#loginuser').val() == event.createdBy) {
                    return true;
                } else {
                    return false;
                }
            }

            function SelectTimeValidate(start) {
                var startDate = new Date(start);
                var today = new Date();
                if (!(startDate.getTime() < today.getTime())) {
                    return true;
                } else {
                    return false;
                }
            }

            function LoginValidate() {
                var status = false;
                if ($('input#loginuser').val()) {
                    status = true;
                }
                return status;
            }

            function eventDelete() {
                if (confirm("確定要刪除？")) {
                    $.post('RoomEventJsonServlet', {cmd: "delete", uId: $('input#uId').val()});
                    setTimeout(function () {
                        window.location = "floorplan.jsp";
                    }, 500);
                } else {

                }
            }

            function ChangeRoom(roomId) {
                $('input#thisroomid').val(roomId);
                $('p#fullcalendarHead').text(roomId + " 會議室");
                $('div#oneDayCalendar').fullCalendar('destroy');
                InitialFullCalendar(roomId);
                /*
                 $('div#oneDayCalendar').fullCalendar('removeEvents');
                 $('div#ondDayCalendat').fullCalendar('removeEventSource', '/BookingManager0410/RoomEventJsonServlet?cmd=room&roomid=101'); //remove eventSource from stored hidden input
                 $('p#fullcalendarHead').text(roomId + " 會議室");
                 $('div#oneDayCalendar').fullCalendar('updateEvent', '/BookingManager0410/RoomEventJsonServlet?cmd=room&roomid=' + roomId);
                 $('div#oneDayCalendar').fullCalendar('addEventSource', '/BookingManager0410/RoomEventJsonServlet?cmd=room&roomid=' + roomId);
                 $('div#oneDayCalendar').fullCalendar('refetchEvents');
                 */
            }

        </script>
    </body>
</html>

