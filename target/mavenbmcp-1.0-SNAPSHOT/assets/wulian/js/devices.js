/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var devices_type = {
    "d02": {"name": "Motion_Sensor", "on": "fa fa-fw fa-bell", "off": "fa fa-fw fa-bell-slash"},
    "d03": {"name": "Contact_Sensor", "on": "fa fa-fw fa-lock", "off": "fa fa-fw fa-unlock"},
    "d12": {"name": "Dimming_Light", "on": "fa fa-fw fa-sort-amount-asc fa-rotate-270", "off": "fa fa-fw fa-sort-amount-asc fa-rotate-270"},
    "d15": {"name": "Calculate Dock", "on": "fa fa-fw fa-plug", "off": "fa fa-fw fa-plug"},
    "d17": {"name": "Temp-Hum", "on": "fa fa-fw fa-gear fa-spin"},
    "d18": {"name": "CO2", "on": "fa fa-fw fa-cloud"},
    "d19": {"name": "Light_Sensor", "on": "fa fa-fw fa-spinner fa-spin"},
    "d22": {"name": "IR_Controller", "on": "fa fa-fw fa-wifi", "off": "fa fa-fw fa-wifi"},
    "d42": {"name": "Air_Quality", "on": "fa fa-fw fa-cloud", "off": "fa fa-fw fa-cloud"},
    "d50": {"name": "Wall_Outlet_1", "on": "fa fa-fw fa-bolt", "off": "fa fa-fw fa-bolt"},
    "d54": {"name": "OnOff_Switch_2", "on": "fa fa-fw fa-link"},
    "d61": {"name": "OnOff_Light_1", "on": "glyphicon glyphicon-minus fa-rotate-90", "off": "glyphicon glyphicon-minus fa-rotate-90"},
    "d62": {"name": "OnOff_Light_2", "on": "glyphicon glyphicon-pause", "off": "glyphicon glyphicon-pause"},
    "d63": {"name": "OnOff_Light_3", "on": "glyphicon glyphicon-menu-hamburger fa-rotate-90", "off": "glyphicon glyphicon-menu-hamburger fa-rotate-90"},
    "d65": {"name": "Curtain_Controller", "hold": "fa fa-fw fa-unsorted", "down": "fa fa-fw fa-sort-desc", "up": "fa fa-fw fa-sort-asc"},
    "d70": {"name": "DoorLock_4", "lock": "fa fa-fw fa-key", "unlock": "fa fa-fw fa-exclamation"}
};

function refresh_devices() {
    /*
     counter++;
     $('#refresh_counter').html(counter);
     
     $.get("_includes/devices.php?cmd=get", function (ret) {
     */
    $.get("DevicesJsonServlet", function (response) {
        "use strict";
        var devices = $.parseJSON(response);

        //alert(devices.length);
        $.each(devices, function (k, v) {
            //delete old icon
            if ($('div[dev="' + v.devID + '"]').length > 0) {
                //if(v.html) $('div[dev="'+v.devID+'"] ul li').html(v.html);
                $('div[dev="' + v.devID + '"]').remove();
            }
            //parse devInfo
            var data = "", icon = "", location = "", color_class = "";
            switch (v.epType) {
                case "02":
                    //var devInfo = $.parseJSON(v.devInfo);
                    if (v.devDataText == "1") {
                        //data = "alarm";
                        data = "偵測";
                        color_class = "alert";
                    } else if (v.devDataText == "0") {

                        //data = "lock";
                        data = "安全";
                        color_class = "on";
                    }

                    icon = devices_type.d02.on;
                    break;
                case "03":
                    //var devInfo = $.parseJSON(v.devInfo);
                    if (v.devDataText == "1") {
                        //data = "open";
                        data = "開啟";
                        color_class = "alert";
                    } else if (v.devDataText == "0") {
                        //data = "lock";
                        data = "安全";
                        color_class = "on";
                    }
                    icon = devices_type.d03.on;
                    /*
                     if (alert == '1') { //告警
                     var cont = '<h3><span  class="entypo-alert"></span > 告警訊息！！</h3>';
                     cont += '<div>裝置名稱:' + v.name + '<br />裝置ID:' + v.devID + '</div>';
                     cont += '<div><br />';
                     cont += '<button type="button" class="btn btn-default" onclick="send_ctrl(\'' + v.devID + '\', \'' + v.eptype + '\', \'0\');">撤防</button>&nbsp;';
                     cont += '<button type="button" class="btn btn-default" onclick="clear_alert(\'' + v.devID + '\', \'' + v.eptype + '\');">知道了，維持佈防</button>&nbsp;';
                     cont += '</div>';
                     create_modal('告警通知', cont);
                     }
                     */
                    break;
                case "12":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData + "%";
                     */
                    if (v.devDataText == "0") {
                        color_class = "off";
                    } else {
                        color_class = "on";
                    }
                    data = v.devDataText + "%";
                    icon = devices_type.d12.on;
                    break;
                case "15":
                    switch (v.devDataText.substr(0, 4)) {
                        case "0100":
                            data = "off";
                            color_class = "off";
                            break;
                        case "0101":
                            data = "on";
                            color_class = "on";
                            break;
                        case "0500"://0500 0000 08AA v 0258 f 000000 p 0000261B w
                            data = "";
                            data += parseInt(v.devDataText.substr(8, 4), 16) / 10 + "V</br>";
                            //data += parseInt(devInfo[0].epData.substr(16, 6), 16) + "P</br>";
                            data += parseInt(v.devDataText.substr(22, 8), 16) / 1000 + "kwh";
                            color_class = "on";
                            break;
                        default:
                            break;
                    }
                    icon = devices_type.d15.on;
                    break;
                case "17":
                    //var devInfo = $.parseJSON(v.devInfo);
                    data = "" +
                            v.devDataText.substr(1, 4) + "℃</br>" +
                            v.devDataText.substr(6, 4) + "%";
                    //+24.9,64.8
                    color_class = "sensor";
                    icon = devices_type.d17.on;
                    break;
                case "18":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo + "ppm";
                     */
                    data = v.devDataText + "ppm";
                    color_class = "sensor";
                    icon = devices_type.d18.on;
                    break;
                case "19":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData + "Lux";
                     */
                    data = v.devDataText + "Lux";
                    color_class = "sensor";
                    icon = devices_type.d19.on;
                    break;
                case "22":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData;
                     */
                    //data = v.devDataText;
                    color_class = "on";
                    icon = devices_type.d22.on;
                    break;
                case "42":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData + "ppm";
                     */
                    data = v.devDataText + "ppm";
                    color_class = "sensor";
                    icon = devices_type.d42.on;
                    break;
                case "50":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData == 1 ? "on" : "off";
                     */
                    if (v.devDataText == "1") {
                        data = "on";
                        color_class = "on";
                    } else if (v.devDataText == "0") {
                        data = "off";
                        color_class = "off";
                    }
                    icon = devices_type.d50.on;
                    break;
                case "54":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     data = devInfo[0].epData == 1 ? "alert" : "lock";
                     */
                    data = v.devDataText == "1" ? "報警" : "安全";
                    color_class = "on";
                    icon = devices_type.d54.on;
                    break;
                case "61":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     for (var i = 0; i < devInfo.length; i++) {
                     data += devInfo[i].epData;
                     }
                     */
                    data = v.devDataText;
                    if (data == "0") {
                        color_class = "off";
                    } else {
                        color_class = "on";
                    }
                    icon = devices_type.d61.on;
                    break;
                case "62":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     for (var i = 0; i < devInfo.length; i++) {
                     data += devInfo[i].epData;
                     }
                     */
                    data = v.devDataText;
                    //if (data == "00") {
                    if (data == "0") {
                        color_class = "off";
                    } else {
                        color_class = "on";
                    }
                    icon = devices_type.d62.on;
                    break;
                case "63":
                    /*
                     var devInfo = $.parseJSON(v.devInfo);
                     for (var i = 0; i < devInfo.length; i++) {
                     data += devInfo[i].epData;
                     }
                     */
                    data = v.devDataText;
                    //if (data == "000") {
                    if (data == "0") {
                        color_class = "off";
                    } else {
                        color_class = "on";
                    }
                    icon = devices_type.d63.on;
                    break;
                case "65":
                    var devInfo = $.parseJSON(v.devInfo);
                    //switch (devInfo[0].epData) {
                    switch (v.devDataText.toLowerCase()) {
                        case "1":
                        case "stop":
                            //data = "hold";
                            data = "半開";
                            icon = devices_type.d65.hold;
                            break;
                        case "3":
                        case "on":
                            //data = "close";
                            data = "全關";
                            icon = devices_type.d65.up;
                            break;
                        case "2":
                        case "off":
                            //data="off";
                            data = "全開";
                            icon = devices_type.d65.down;
                            break;
                        default:
                            break;
                    }
                    color_class = "on";
                    break;
                case "70":
                    var devinfo = $.parseJSON(v.devInfo);
                    //data = devInfo[0].epData;
                    switch (devinfo[0].epData) {
                        case "1":
                            data = "unlock";
                            color_class = "off";
                            break;
                        case "2":
                            data = "lock";
                            color_class = "on";
                            break;
                        case "3":
                            data = "查詢";
                            color_class = "on";
                            break;
                        case "30":
                            data = "密碼開啟";
                            color_class = "off";
                            break;
                        case "144":
                            data = "APP開啟";
                            color_class = "off";
                            break;
                        case "145":
                            data = "APP開啟錯誤";
                            color_class = "alert";
                            break;
                        default:
                            break;
                    }

                    icon = devices_type.d70.lock;
                    break;
                default:
                    break;
            }

            //create div html
            //var html = '<a href="#" onclick="show_ctrl(' + v.epType + ',' + v.devID + ');">'
            var html = '<div id="' + v.devID + '" eptype="' + v.epType + '" dev="' + v.devID + '" epdata="' + v.devDataText + '" class="ctl ' + color_class + '"><i class="' + icon + '"></i>';
            if (data.length > 0) {
                html += '<ul><li>' + data + '</li></ul>';
            }
            html += '<span></span></div></a>';


            //append htm to div location
            location = v.location.split(",");
            if (location[1]) {
                //$("p#test").html(v.location);
                $(html).addClass('ico-mode').addClass('wulian').addClass('draggable').css({position: "absolute", top: location[1] + 'px', left: location[0] + 'px'}).appendTo('div#floor1').click(function () {
                    console.log("");
                    show_ctrl(v.epType, v.devID);
                    console.log("");
                });
            } else {
                $(html).addClass('ico-mode').addClass('wulian').addClass('draggable').css({position: "relative"}).appendTo('div#devices_remain').click(function () {
                    console.log("");
                    show_ctrl(v.epType, v.devID);
                    console.log("");
                });
            }
            /*
             if (v.datatype && $('#all-devID option[value="' + v.devID + '"]').length <= 0) {
             var opt = '<option datatype="' + v.datatype + '" value="' + v.devID + '">' + v.devID + '</option>';
             $('#all-devID').append(opt);
             }
             */
        });
    });

}
function show_ctrl(eptype, devID) {
    var cont = "", btn1 = "", btn2 = "", chk_status;
    switch (eptype) {
        case "02": //紅外感應
        case "03":
            console.log("03");
            cont = '<div>裝置ID：' + devID + '</div>';
            btn1 = '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'0\');">撤防</button>';
            btn2 = ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\',\'1\');">佈防</button></div>';
            cont = cont + btn1 + btn2;
            var dev_name = eptype == "02" ? "門窗感應裝置" : "紅外感應裝置";
            create_modal(dev_name, cont);
            break;
        case "12": //調光開關
            console.log("12");
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div class="light-slider-row"><br />';
            cont += '<div style="float:left; width:20%">調光設定：</div>';
            cont += '<div style="float:left; width:70%" id="light-slider" class="light-slider"></div>';
            cont += '</div>';
            create_modal('調光開關控制', cont);
            var light = $('#' + devID).attr('epdata');
            $('.light-slider').slider({
                value: light,
                change: function (event, ui) {
                    var new_light = ui.value;
                    var txt = '';
                    send_ctrl(devID, eptype, new_light);
                    if (new_light == 100) {
                        txt = '全開';
                    } else if (new_light == 0) {
                        txt = '全關';
                    } else {
                        txt = new_light + '%';
                    }
                    alert('已設定至' + txt);
                }
            });
            break;
        case "15": //計量插座
            console.log("15");
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'11\');">開</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'10\');">關</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'50\');">查詢</button></div>';
            create_modal('計量插座控制', cont);
            break;

        case "22": //紅外控制
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2511\');">開 / 關</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2512\');">選台上</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2513\');">選台下</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2514\');">音量大</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2515\');">音量小</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2516\');">1</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2517\');">2</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2518\');">3</button></div>';
            create_modal('紅外轉發控制', cont);
            break;
        case "50": //單鍵插座
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'1\');">開</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'0\');">關</button></div>';
            create_modal('單鍵插座控制', cont);
            break;
        case "61": //單切
            chk_status = get_switch_status(devID);
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div id="switcher-' + devID + '"><br />';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[0] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'0\');">開關 1 </label></div>';
            create_modal('單切開關', cont);
            $('#switcher-' + devID + ' input:checkbox').bootstrapToggle();
            break;
        case "62": //雙切
            chk_status = get_switch_status(devID);
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div id="switcher-' + devID + '"><br />';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[0] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'0\');">開關 1 </label>';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[1] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'1\');">開關 2 </label></div>';
            create_modal('雙切開關', cont);
            $('#switcher-' + devID + ' input:checkbox').bootstrapToggle();
            break;
        case "63": //三切
            chk_status = get_switch_status(devID);
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div id="switcher-' + devID + '"><br />';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[0] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'0\');">開關 1 </label>';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[1] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'1\');">開關 2 </label>';
            cont += '<label class="checkbox-inline"> <input type="checkbox" ' + chk_status[2] + ' data-toggle="toggle" onchange="send_switch(\'' + devID + '\', \'' + eptype + '\', \'2\');">開關 3 </label></div>';
            create_modal('三切開關', cont);
            $('#switcher-' + devID + ' input:checkbox').bootstrapToggle();
            break;
        case "65": //curtain controller
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'1\');">暫停</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'2\');">關</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'3\');">開</button></div>';
            create_modal('窗簾控制', cont);
            break;
        case "70": //4 generation door lock
            cont = '<div>裝置ID：' + devID + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'11\');">解鎖</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'12\');">上鎖</button>';
            cont += ' &nbsp; <button type="button" class="btn btn-default" onclick="send_ctrl(\'' + devID + '\', \'' + eptype + '\', \'13\');">查詢</button></div>';
            create_modal('門鎖控制', cont);
            break;
        case "crestron":
            var ip = $('#' + devID).attr('ip');
            $('#crestron-window').attr('src', ip);
            $('#crestron-modal').modal('show');
            break;
        case "ipcam":
            switch (devID) {
                case "ipcam1":
                    $("#device_table").toggle(1000);
                    $('#ipcam_div1').toggle(1000);
                    break;
                case "ipcam2":
                    $("#device_table").toggle(1000);
                    $('#ipcam_div2').toggle(1000);
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}
function send_ctrl(devID, epType, ctrlcode, keepme) {
    //$.post('http://localhost/Wulian2Bluevilla/Transervlet?cmd=control', {strGwID: '50294D2070F5', strDevID: devID, strDevType: epType, strCtrlData: ctrlcode}, function (res) {
    //$.post('http://localhost:8084/Wulian2Bluevilla/Transervlet?cmd=control', {strGwID: '40124CDC6628', strDevID: devID, strDevType: epType, strCtrlData: ctrlcode}, function (res) {
    $.post('http://192.168.141.119/Wulian2Bluevilla/Transervlet?cmd=control', {strGwID: '50294D2070F5', strDevID: devID, strDevType: epType, strCtrlData: ctrlcode}, function (res) {
        if (!keepme) {
            $('#ctrl-modal').modal('hide');
        }
        refresh_devices(true);
    });
}
function send_switch(devID, epType, seq) {
    var ctrlcode = '';
    $('#switcher-' + devID + ' input:checkbox').each(function (i, j) {
        if (i == seq) {
            var stat = $(this).prop('checked') ? '1' : '0';
            ctrlcode += stat;
        } else {
            ctrlcode += '2';
        }
    });
    send_ctrl(devID, epType, ctrlcode, 1);
}
function get_switch_status(devID) {
    var epData = $('#' + devID).attr('epdata');
    var statuses = epData.split("");
    var chk_status = [];
    $.each(statuses, function (k, j) {
        chk_status[k] = j == 'Y' ? 'checked' : '';
    });
    return chk_status;
}
function create_modal(title, cont) {
    $('#ctrl-title').html(title);
    $('#ctrl-content').html(cont);
    $('#ctrl-modal').modal('show');
}
function close_modal() {
    $('#ctrl-modal').modal('hide');
}
/*
 function clear_alert(devID, epType) {
 get_data('_includes/devices.php?cmd=clear', {devID: devID, epType: epType}, function (res) {
 close_modal();
 });
 }
 */