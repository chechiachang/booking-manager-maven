<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : signage
    Created on : Apr 27, 2015, 9:55:50 AM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sinage</title>
        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
        <!-- JQuery UI -->
        <link rel="stylesheet" href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css">
        <script src="assets/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
        <!-- full calendar-->
        <script src='assets/fullcalendar/js/moment.js'></script>
        <script src='assets/fullcalendar/js/fullcalendar2.js'></script>
        <link rel='stylesheet' href='assets/fullcalendar/css/fullcalendar2.css'>
        <script src='assets/fullcalendar/js/zh-tw.js'></script>
        <!-- swiper -->
        <script src="assets/Swiper-3.0.8/dist/js/swiper.min.js"></script>
        <link rel="stylesheet" href="assets/Swiper-3.0.8/dist/css/swiper.min.css">
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">

        <style>
            body{
                overflow-y:hidden;
            }
            .swiper-container {
                max-width: 600px;
                max-height: 600px;
            }
            .swiper-slide {
                width:600px;
                height:600px;
                text-align: center;
                font-size: 18px;
                background: #fff;
                /* Center slide text vertically */
                display: -webkit-box;
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                -webkit-justify-content: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                -webkit-align-items: center;
                align-items: center;
            }
            .floorplan-title{
                position:absolute;
                top:10px;
                left:10px;
            }
            div#building img{
                position: absolute;

            }

            @media (min-width: 768px) {
                .modal-xl {
                    width: 90%;
                    max-width:1200px;
                }
            }
        </style>
    </head>
    <body>
        <c:import url="GetAllObjectClassesAction"></c:import>
        <c:import url="GetAllRoomAction"></c:import>
        <jsp:include page="navbar.jsp"></jsp:include>
            <section>
                <div class="modal fade" id="details" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container-fluid"> 
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <div id="building">
                                                <img src="images/floors-1f.png" alt="#"/>
                                                <img src="images/floors-2f.png" alt="#" hidden/>
                                                <img src="images/floors-3f.png" alt="#" hidden/>
                                                <img src="images/floors-4f.png" alt="#" hidden/>
                                                <img src="images/floors-5f.png" alt="#" hidden/>
                                                <img src="images/floors-6f.png" alt="#" hidden/>
                                                <img src="images/floors-7f.png" alt="#" hidden/>
                                                <img src="images/floors-8f.png" alt="#" hidden/>
                                            </div>
                                        </div><!-- col-lg-3 -->
                                        <!-- floorplan-->
                                        <div id="floorplan" class="col-lg-7">
                                            <!-- Slider main container -->
                                            <div class="swiper-container">
                                                <!-- Additional required wrapper -->
                                                <div id="swiper-wrapper" class="swiper-wrapper">
                                                    <!-- Slides -->
                                                <c:forEach var="objectClass" items="${objectClasses}">
                                                    <div id="swiper-slide${objectClass.id}" class="swiper-slide">
                                                        <img class="floorplan" src="${objectClass.image_uri}" alt="#" height="600" width="600"/>
                                                        <div class="floorplan-title">
                                                            <h1>${objectClass.name}</h1>
                                                        </div>                               
                                                        <!-- load div foe each slide-->
                                                        <c:forEach var="room" items="${rooms}">
                                                            <c:choose>
                                                                <c:when test="${room.class_id eq objectClass.id}">
                                                                    <a href="#">
                                                                        <div id="${room.roomId}" class="roomInFloor draggable resizable" style="top:${room.top}px; left:${room.left}px; height:${room.height}px; width:${room.width}px;background-color:${room.color};font-size:${room.fontSize}em;">
                                                                            <c:out value="${room.name}"></c:out><br/>
                                                                            <c:out value="${room.text}"></c:out>
                                                                            </div>
                                                                        </a>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div><!-- col-lg-3 -->
                                    <div id="roomInfo" class="col-lg-3">
                                        <form>
                                            <div class="form-group">
                                                <h4>會議內容</h4>
                                                <div class="input-group">
                                                    <div class="input-group-addon">會議名稱</div>
                                                    <input id="title" class="form-control"/>
                                                </div>
                                                <br/>
                                                <div class="input-group">
                                                    <div class="input-group-addon">會議地點</div>
                                                    <input id="roomId" class="form-control"/>
                                                    <div class="input-group-addon">會議室</div>
                                                </div>
                                                <br/>
                                                <div class="input-group">
                                                    <div class="input-group-addon">主辦單位</div>
                                                    <input id="showName" class="form-control"/>
                                                </div>
                                                <br/>
                                                <div class="input-group">
                                                    <div class="input-group-addon">會議備註</div>
                                                    <input id="description" class="form-control"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div><!-- col-lg-3 -->
                                </div><!-- row -->
                            </div>   
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->  
        </section>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div><p id="fullcalendarHead"></p></div>
                        <input id="thisroomid" value="1" hidden>
                        <div id="resourceCalendar"></div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            var highlightRoomId = 0;
            var highlightClassId = 0;
            $(function () {

                InitialFullCalendar(1);
                setTimeout(function () {
                    $('div#building').fadeOut("slow");
                    $('div#floorplan').fadeOut("slow");
                    $('div#roomInfo').fadeOut("slow");
                }, 100);

                $('div.swiper-container').click(function () {
                    //erase event info
                    $('input#roomId').val("");
                    $('input#title').val("");
                    $('input#showName').val("");
                    $('input#description').val("");

                    //hide swiper
                    $('div#building').fadeOut("slow"); //fade out and switch to 1f
                    $('div#floorplan').fadeOut("slow");
                    $('div#roomInfo').fadeOut("slow");
                    //reset hightlight
                    $('div#' + highlightRoomId).css({"border-color": "black"});
                    //clear footprint
                    $('div#swiper-slide' + highlightClassId).find('div.footprint').remove();
                    highlightRoomId = 0;
                    highlightClassId = 0;
                });
            });
            var mySwiper = new Swiper('.swiper-container', {
                // Optional parameters
                direction: 'horizontal',
                //control
                loop: false,
                noSwiping: false
            });
            function InitialFullCalendar(classId) {
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
                $('div#resourceCalendar').fullCalendar({
                    height: 'auto',
                    lang: 'zh-tw',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,resourceDay'
                    },
                    columnFormat: 'ddd M/D',
                    defaultView: 'resourceDay',
                    timezone: 'local',
                    businessHour: {
                        start: '09:00', // a start time (10am in this example)
                        end: '18:00', // an end time (6pm in this example)
                        dow: [1, 2, 3, 4, 5]
                                // days of week. an array of zero-based day of week integers (0=Sunday)
                                // (Monday-Thursday in this example)
                    },
                    resources: 'RoomEventJsonServlet?cmd=allrooms',
                    events: 'RoomEventJsonServlet?cmd=get',
                    allDaySlot: false,
                    //event options
                    selectable: false,
                    selectOverlap: false,
                    startEditable: false,
                    eventStartEditable: false,
                    eventOverlap: false,
                    droppable: false,
                    editable: false,
                    minTime: "09:00:00",
                    maxTime: "19:00:00",
                    duration: "01:00:00",
                    select: function (start, end) {
                    },
                    dayClick: function (date, jsEvent, view) {
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        highlightRoomId = calEvent.roomId;
                        highlightClassId = RoomIdToClassId(highlightRoomId);
                        //swipe to floor
                        mySwiper.slideTo(highlightClassId - 1);
                        //highlight room
                        $('div#' + highlightRoomId).css({"border-color": "yellow"});
                        // footprint
                        // building first footprint followed roomInfo last
                        ChangeFloor(calEvent.roomId);
                        $('div#building').fadeIn("slow", function () {
                        });

                        $('div#floorplan').fadeIn("slow", function () {
                            setTimeout(
                                    Footprints(highlightClassId, highlightRoomId),
                                    2000);
                        });
                        $('div#roomInfo').fadeIn("slow", function () {
                            setTimeout(function () {
                                $('input#roomId').val(calEvent.roomId.toString().substr(0, 1) + "樓 " + calEvent.roomId);
                                $('input#title').val(calEvent.title);
                                $('input#showName').val(calEvent.showName);
                                $('input#description').val(calEvent.description);
                            }, 300);
                        });

                        $('div#details').modal({});
                        setTimeout(function () {
                            $('div#details').modal('hide');
                        }, 15000);
                        
                    },
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
            function RoomIdToClassId(roomId) {
                if (roomId / 100 > 8) {
                    return 6;
                }
                else if (roomId / 100 > 7) {
                    return 5;
                } else if (roomId / 100 > 6) {
                    return 4;
                } else if (roomId / 100 > 5) {
                    return 3;
                } else if (roomId / 100 > 4) {
                    return 2;
                } else if (roomId / 100 > 2) {
                    return 1;
                }
            }
            function ChangeFloor(roomId) {
                $('div#building img').hide();
                $('div#building img:nth-child(' + roomId.toString().substr(0, 1) + ')').show();
            }
            function Footprints(highlightClassId, highlightRoomId) {
                var target = $('div#swiper-slide' + highlightClassId);
                //remove old footprint
                target.find('div.footprint').remove();
                //print invisible footprint

                $.post('GetRoomFootpathAction', {roomId: highlightRoomId}, function (json) {
                    var index = 0;
                    for (var i = 0; i < json.length - 1; i++) {
                        if (json[i + 1].x == json[i].x) {
                            //vertical movement
                            if (json[i + 1].y > json[i].y) {
                                //downward
                                var mark = json[i].y;
                                while (mark < json[i + 1].y) {
                                    index++;
                                    var img = $('<img/>', {
                                        width: "30px",
                                        height: "30px",
                                        src: "images/footprints-d.png",
                                        alt: "#"
                                    });
                                    var div = $('<div/>', {
                                        id: "footprint" + index,
                                        class: "footprint"
                                    });
                                    div.css({"left": json[i].x + "px", "top": mark + "px", opacity: 0});
                                    div.prepend(img).appendTo(target);
                                    mark += 30;
                                }
                            } else {
                                //upward

                                var mark = json[i].y;
                                while (json[i + 1].y < mark) {
                                    index++;
                                    var img = $('<img/>', {
                                        width: "30px",
                                        height: "30px",
                                        src: "images/footprints-u.png",
                                        alt: "#"
                                    });
                                    var div = $('<div/>', {
                                        id: "footprint" + index,
                                        class: "footprint"
                                    });
                                    div.css({"left": json[i].x + "px", "top": mark + "px", opacity: 0});
                                    div.prepend(img).appendTo(target);
                                    mark -= 30;
                                }
                            }
                        } else {
                            //horizontal movement
                            if (json[i + 1].x > json[i].x) {
                                //rightward
                                var mark = json[i].x;
                                while (json[i + 1].x > mark) {
                                    index++;
                                    var img = $('<img/>', {
                                        width: "30px",
                                        height: "30px",
                                        src: "images/footprints-r.png",
                                        alt: "#"
                                    });
                                    var div = $('<div/>', {
                                        id: "footprint" + index,
                                        class: "footprint"
                                    });
                                    div.css({"left": mark + "px", "top": json[i].y + "px", opacity: 0});
                                    div.prepend(img).appendTo(target);
                                    mark += 30;
                                }
                            } else {
                                //leftward
                                var mark = json[i].x;
                                while (json[i + 1].x < mark) {
                                    index++;
                                    var img = $('<img/>', {
                                        width: "30px",
                                        height: "30px",
                                        src: "images/footprints-l.png",
                                        alt: "#"
                                    });
                                    var div = $('<div/>', {
                                        id: "footprint" + index,
                                        class: "footprint"
                                    });
                                    div.css({"left": mark + "px", "top": json[i].y + "px", opacity: 0});
                                    div.prepend(img).appendTo(target);
                                    mark -= 30;
                                }
                            }

                        }
                    }
                    //animate footprint div
                    for (var i = 1; i < index + 1; i++) {
                        target.find('div#footprint' + i).animate({opacity: 1}, 2000);
                    }
                }); //#.post

            }
            /*
             function ChangeRoom(roomId) {
             $('input#thisroomid').val(roomId);
             $('p#fullcalendarHead').text(roomId + " 會議室");
             $('div#todayCalendar').fullCalendar('destroy');
             InitialFullCalendar(roomId);
             }
             */
        </script>
    </body>
</html>
