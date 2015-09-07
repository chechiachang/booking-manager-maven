<%-- 
    Document   : lockcontrol
    Created on : Jun 4, 2015, 4:32:01 PM
    Author     : davidchang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lock Control</title>
        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css">
        <script src="assets/bootstrap-switch/js/bootstrap-switch.min.js"></script>
        <link rel="stylesheet" href="assets/bootstrap-switch/css/bootstrap-switch.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
        <!-- JQuery UI -->
        <link rel="stylesheet" href="assets/jquery-ui-1.11.4.custom/jquery-ui.min.css">
        <script src="assets/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
        <!-- Custom -->
        <link rel="stylesheet" href="css/index.css">
        <style>
            input.time{
                border:none;
                width:40px;
                text-align: center;
                alignment-adjust: central;
                background: rgba(0,0,0,0);
            }
            div.center{
                text-align: center;
            }
            td{
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 center">
                        <table class="table">
                            <!--[Future] Use jsp auto print rooms -->
                            <tr>
                                <td></td>
                                <td>307</br>階梯簡報室</td>
                                <td>401</br>中型會議室</td>
                                <td>403</br>中型會議室</td>
                                <td>411</br>貴賓室</td>
                                <td>B1</br>商品展售區</td>
                                <td></br>多功能集會堂</td>
                                <td>507</br>大型階梯會議室</td>
                                <td>511</br>簡報階梯室</td>
                                <td>603</br>大禮堂</td>
                                <td>一樓</br>東側大廳</td>
                                <td>一樓</br>西側大廳</td>
                                <td></br>市民廣場</td>
                            </tr>
                            <tr>
                                <td>自動</br>模式</td>
                                <td><input type="checkbox" id="auto1"></td>
                                <td><input type="checkbox" id="auto2"></td>
                                <td><input type="checkbox" id="auto3"></td>
                                <td><input type="checkbox" id="auto4"></td>
                                <td><input type="checkbox" id="auto5"></td>
                                <td><input type="checkbox" id="auto6"></td>
                                <td><input type="checkbox" id="auto7"></td>
                                <td><input type="checkbox" id="auto8"></td>
                                <td><input type="checkbox" id="auto9"></td>
                                <td><input type="checkbox" id="auto10"></td>
                                <td><input type="checkbox" id="auto11"></td>
                                <td><input type="checkbox" id="auto12"></td>
                            </tr>
                            <tr>
                                <td>狀態</td>
                                <td><input type="checkbox" id="switch1"></td>
                                <td><input type="checkbox" id="switch2"></td>
                                <td><input type="checkbox" id="switch3"></td>
                                <td><input type="checkbox" id="switch4"></td>
                                <td><input type="checkbox" id="switch5"></td>
                                <td><input type="checkbox" id="switch6"></td>
                                <td><input type="checkbox" id="switch7"></td>
                                <td><input type="checkbox" id="switch8"></td>
                                <td><input type="checkbox" id="switch9"></td>
                                <td><input type="checkbox" id="switch10"></td>
                                <td><input type="checkbox" id="switch11"></td>
                                <td><input type="checkbox" id="switch12"></td>
                            </tr>
                            <tr>
                                <td>開啟</br>鎖定</td>
                                <td><input type="checkbox" id="open1"></td>
                                <td><input type="checkbox" id="open2"></td>
                                <td><input type="checkbox" id="open3"></td>
                                <td><input type="checkbox" id="open4"></td>
                                <td><input type="checkbox" id="open5"></td>
                                <td><input type="checkbox" id="open6"></td>
                                <td><input type="checkbox" id="open7"></td>
                                <td><input type="checkbox" id="open8"></td>
                                <td><input type="checkbox" id="open9"></td>
                                <td><input type="checkbox" id="open10"></td>
                                <td><input type="checkbox" id="open11"></td>
                                <td><input type="checkbox" id="open12"></td>
                            </tr>
                            <tr>
                                <td>上鎖</br>鎖定</td>
                                <td><input type="checkbox" id="close1"></td>
                                <td><input type="checkbox" id="close2"></td>
                                <td><input type="checkbox" id="close3"></td>
                                <td><input type="checkbox" id="close4"></td>
                                <td><input type="checkbox" id="close5"></td>
                                <td><input type="checkbox" id="close6"></td>
                                <td><input type="checkbox" id="close7"></td>
                                <td><input type="checkbox" id="close8"></td>
                                <td><input type="checkbox" id="close9"></td>
                                <td><input type="checkbox" id="close10"></td>
                                <td><input type="checkbox" id="close11"></td>
                                <td><input type="checkbox" id="close12"></td>
                            </tr>
                            <tr>
                                <td>排程</td>
                                <td><p id="title1"></p></td>
                                <td><p id="title2"></p></td>
                                <td><p id="title3"></p></td>
                                <td><p id="title4"></p></td>
                                <td><p id="title5"></p></td>
                                <td><p id="title6"></p></td>
                                <td><p id="title7"></p></td>
                                <td><p id="title8"></p></td>
                                <td><p id="title9"></p></td>
                                <td><p id="title10"></p></td>
                                <td><p id="title11"></p></td>
                                <td><p id="title12"></p></td>
                            </tr>
                            <tr>
                                <td>開始</td>
                                <td><p id="start1"></p></td>
                                <td><p id="start2"></p></td>
                                <td><p id="start3"></p></td>
                                <td><p id="start4"></p></td>
                                <td><p id="start5"></p></td>
                                <td><p id="start6"></p></td>
                                <td><p id="start7"></p></td>
                                <td><p id="start8"></p></td>
                                <td><p id="start9"></p></td>
                                <td><p id="start10"></p></td>
                                <td><p id="start11"></p></td>
                                <td><p id="start12"></p></td>
                            </tr>
                            <tr>
                                <td>結束</td>
                                <td><p id="end1"></p></td>
                                <td><p id="end2"></p></td>
                                <td><p id="end3"></p></td>
                                <td><p id="end4"></p></td>
                                <td><p id="end5"></p></td>
                                <td><p id="end6"></p></td>
                                <td><p id="end7"></p></td>
                                <td><p id="end8"></p></td>
                                <td><p id="end9"></p></td>
                                <td><p id="end10"></p></td>
                                <td><p id="end11"></p></td>
                                <td><p id="end12"></p></td>
                            </tr>
                        </table>
                        <div class="center">
                            <input id="year" class="time">年<input id="month" class="time">月<input id="date" class="time">日
                            <input id="hour" class="time">時<input id="minute" class="time">分<input id="second" class="time">秒
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            //auto mode, default=true
            var auto = [true, true, true, true, true, true, true, true, true, true, true, true];
            var state = [false, false, false, false, false, false, false, false, false, false, false, false];
            $(function () {
                InitializeSwitch();
                //get date
                GetTime();
                //get json
                GetNtceventJson();
                //check lock time
                LockTimeChecker();
                //main timer
                setInterval(function () {
                    var second = parseInt($('input#second').val()) + 1;
                    if (second < 60) {
                        $('input#second').val(second);
                    } else {
                        //refresh time and Json every minute, then check lock time
                        GetTime();
                        GetNtceventJson();
                        LockTimeChecker();
                    }
                }, 1000);
                //switch direct/auto cmd
                $('input[id*="switch"]').on('switchChange.bootstrapSwitch', function (event, state) {
                    //console.log(this); // DOM element
                    //console.log(event); // jQuery event
                    console.log(state); // true | false
                    if (state) {
                        LockControl(1);
                        console.log("LockControl(1)");
                    } else {
                        LockControl(0);
                        console.log("LockControl(0)");
                    }
                });
                //auto 
                $('input[id*="auto"]').on('switchChange.bootstrapSwitch', function (event, state) {
                    if (state) {
                        auto[$(this).index()] = false;
                    } else {
                        auto[$(this).index()] = true;
                    }
                });
                //if invoke onclick, disable auto mode
                /*
                 $.on('click','input[id*="switch"]', function () {
                 alert($(this).index());
                 $('input#auto' + ($(this).index() + 1)).bootstrapSwitch('state', false);
                 });
                 */

            });
            function InitializeSwitch() {
                //initial bootstrap-switch
                $('input[id*="auto"]').bootstrapSwitch({
                    size: 'small',
                    onText: '自動',
                    offText: '手動',
                    onColor: 'primary'
                });
                $('input[id*="switch"]').bootstrapSwitch({
                    size: 'normal',
                    onText: '鎖',
                    offText: '開',
                    onColor: 'danger',
                    offColor: 'success'
                });
                $('input[id*="open"]').bootstrapSwitch({
                    size: 'normal',
                    onText: '開',
                    offText: '無',
                    onColor: 'warning'
                });
                $('input[id*="close"]').bootstrapSwitch({
                    size: 'normal',
                    onText: '鎖',
                    offText: '無',
                    onColor: 'info'
                });
                //Synchronize switch
                for (var i = 0; i < 12; i++) {
                    $('input#switch' + (i + 1)).bootstrapSwitch('state', state[i]);
                }

                //Synchronize auto mode
                for (var i = 0; i < 12; i++) {
                    $('input#auto' + (i + 1)).bootstrapSwitch('state', auto[i]);
                }
            }

            function GetTime() {
                var date = new Date();
                $('input#year').val(date.getFullYear());
                $('input#month').val(date.getMonth() + 1);
                $('input#date').val(date.getDate());
                $('input#hour').val(date.getHours());
                $('input#minute').val(date.getMinutes());
                $('input#second').val(date.getSeconds());
            }

            function GetNtceventJson() {
                var date = new Date();
                var m = date.getMonth() > 8 ? "" + (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
                var d = date.getDate() > 9 ? "" + date.getDate() : "0" + date.getDate();
                var strDate = date.getFullYear() + "/" + m + "/" + d;
                //#alert(strDate);
                $.post("NtcEventJsonServlet", {cmd: "time", date: strDate}, function (jsonResponse) {
                    //#alert(jsonResponse.length);
                    //i-- event overwite until nearest event
                    for (var i = jsonResponse.length - 1; i > -1; i--) {
                        //past event
                        //format "start":"2015-05-28T09:00:00.0"
                        //#alert(" jsonResponse[i].start: " + jsonResponse[i].start + " jsonResponse[i].start.substr(0, 19): " + jsonResponse[i].start.substr(0, 19));
                        var dateStart = new Date(jsonResponse[i].start.substr(0, 19));
                        //#alert(" dateStart.getTime(): " + dateStart.getTime() + " date.getTime() " + date.getTime());
                        //
                        //future event only
                        if (dateStart.getTime() > date.getTime()) {
                            var roomId = jsonResponse[i].roomId;
                            //#alert(" jsonResponse[i].roomId " + jsonResponse[i].roomId + " jsonResponse[i].start " + jsonResponse[i].start);
                            $('p#title' + roomId).html(jsonResponse[i].title);
                            $('p#start' + roomId).html(jsonResponse[i].start.substr(11, 8));
                            $('p#end' + roomId).html(jsonResponse[i].end.substr(11, 8));
                        }
                    }
                }, "json");
            }

            //invoke LockControl() within 5 minutes before event start
            function LockTimeChecker() {
                var date = new Date();
                for (var roomIndex = 1; roomIndex < 13; roomIndex++) {
                    //if target room's auto mode is true
                    if (auto[roomIndex - 1]) {
                        var strStartTime = $('p#start' + roomIndex).text(); //hh/mm/ss
                        var strEndTime = $('p#end' + roomIndex).text();
                        //no strStartTime, no need to check
                        if (strStartTime.length > 0) {
                            //#alert(date.getFullYear()+";"+date.getMonth()+";"+date.getDate()+";"+strStartTime.substr(0, 2)+";"+strStartTime.substr(3, 2)+";"+strStartTime.substr(6, 2));
                            var dateStart = new Date(date.getFullYear(), date.getMonth(), date.getDate(), strStartTime.substr(0, 2), strStartTime.substr(3, 2), strStartTime.substr(6, 2));
                            var dateEnd = new Date(date.getFullYear().date.getMonth(), date.getDate(), strEndTime.substr(0, 2), strEndTime.substr(3, 2), strEndTime.substr(6, 2));
                            //#alert(dateStart.getTime()+"-"+date.getTime());
                            //#alert(dateStart.getTime() - 5 * 60 * 1000 < date.getTime() && date.getTime() < dateStart.getTime());
                            if (dateStart.getTime() - 5 * 60 * 1000 < date.getTime() && date.getTime() < dateStart.getTime() + 1) {
                                //unlock at -5 ~ 0 minutes before event start
                                $('input[id*="switch"]').bootstrapSwitch('state', false);
                            } else if (dateEnd.getTime() - 1 < date.getTime() && date.getTime() < dateEnd.getTime() + 5 * 60 * 1000) {
                                //unlock at 0 ~ 5 minutes after event end
                                $('input[id*="switch"]').bootstrapSwitch('state', false);
                            } else if (dateEnd.getTime() + 5 * 60 * 1000 < date.getTime() && date.getTime() < dateEnd.getTime() + 10 * 60 * 1000) {
                                //lock at 5 ~ 10 minitue after event start
                                $('input[id*="switch"]').bootstrapSwitch('state', true);
                            }
                        }
                    }
                }
            }

            function LockControl(cmd) {
                var strServerUrl = "http://192.168.16.4";
                var strLockDevID = "CC0B3803004B1200";
                var urlUnlock = strServerUrl + "/Wulian2Sky/Transervlet?cmd=control&strGwID=40124CDC6628&strDevID="
                        + strLockDevID + "&strDevType=62&strCtrlData=00";
                var urlLock = strServerUrl + "/Wulian2Sky/Transervlet?cmd=control&strGwID=40124CDC6628&strDevID="
                        + strLockDevID + "&strDevType=62&strCtrlData=10";
                switch (cmd) {
                    case 0:
                        $.post(urlUnlock);
                        break;
                    case 1:
                        $.post(urlLock);
                        break;
                }
            }

            //Get Devices IDs and return str[]
            function aGetDeviceID(index) {
                var aDeviceID;
                aDeviceID = ["CC0B3803004B1200"];
                return aDeviceID[index];
            }
        </script>
    </body>
</html>
