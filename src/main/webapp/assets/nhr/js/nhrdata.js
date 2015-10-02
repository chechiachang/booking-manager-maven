/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var nhr_devices_type = {
    "temp_humid": {"name": "temp_humid", "on": "fa fa-fw fa-spin fa-gear", "off": "fa fa-fw fa-gear fa-spin"},
    "motion_sensor": {"name": "motion_sensor", "on": "fa fa-fw fa-bell", "off": "fa fa-fw fa-bell-slash"},
    "door_seal": {"name": "door_seal", "on": "fa fa-fw fa-lock", "off": "fa fa-fw fa-unlock"},
    "bullhorn": {"name": "bullhorn", "on": "fa fa-fw fa-bullhorn"},
    "unknown": {"name": "unknown", "on": "fa fa-fw fa-question"}
};
/*
 * $(function () {
 * setInterval(getNhrData, 1000);
 * });
 */

function getNhrData() {

    if(nhrPause){
        return false;
    }
    //cause screen flash, which is bad
    //$('div#floor1').empty();

    //$('.nhr').remove();

    $.get("NhrDataJsonServlet", {cmd: "getdata"}, function (jsonResponse) {
        var datas = $.parseJSON(jsonResponse);
        $.each(datas, function (k, v) {
            var icon = "", data = "", iconClass;
            //switch by devices type
            switch (v.type) {
                case "00":  //unknown;
                    icon = nhr_devices_type.unknown.on;
                    break;
                case "02":  //STH-01ZB temp humidity sensor
                    data = v.data2 + "℃<br/>";
                    data += v.data + "%";
                    icon = nhr_devices_type.temp_humid.on;
                    iconClass = "sensor";
                    break;
                case "03":  //STH-Mo2ZB temp humidity sensor
                    data = v.data2 + "℃<br/>";
                    data += v.data + "%";
                    icon = nhr_devices_type.temp_humid.on;
                    iconClass = "sensor";
                    break;
                case "20":  //door electronic seal
                    data = v.data;
                    if (data == "on") {//on / off = alert / safe
                        data = "偵測";
                        iconClass = "alert";
                    } else {
                        data = "安全";
                        iconClass = "on";
                    }
                    icon = nhr_devices_type.door_seal.on;
                    break;
                case "26":
                    data = v.data;
                    if (data == "on") {//on / off = alert / safe
                        data = "偵測";
                        iconClass = "alert";
                    } else {
                        data = "安全";
                        iconClass = "on";
                    }
                    icon = nhr_devices_type.motion_sensor.on;
                    break;
                case "41":  //S05-ST PT100 / soil temp sensor
                case "42":  //S05-SM soil moisture sensor
                case "45":  //S05-TH air-temp humidity sensor
                case "52":  //S05-LM leaf wetness sensor
                case "80":  //power meter
                case "a1":  //Single relay
                case "b1":  //Single PMW
                    icon = nhr_devices_type.unknown.on;
                    iconClass = "off";
                    break;
                case "d0":  //A10 Siren
                    iconClass = "on";
                    icon = nhr_devices_type.bullhorn.on;
                    //data = "報警";
                    break;
                default:
                    iconClass = "off";
                    icon = nhr_devices_type.unknown.on;
                    break;
            }

            if (v.address.length > 0) {
                $('div#' + v.address).remove();
            }
            var html = '<div id="' + v.address + '"' +
                    ' shortmac="' + v.shortMac + '"' +
                    ' clusterid= "' + v.clusterId + '"' +
                    ' class= "nhr ' + iconClass + '"' +
                    ' data="' + data + '"' +
                    ' voltage="' + v.voltage + '"' +
                    ' battery="' + v.battery + '"'
                    ;

            html += '>';
            html += '<i class="fa fa-fw ' + icon + '"></i>';
            html += '</br>';
            html += '<div class="datatext">' + data + '</div>';
            html += '<span></span>';
            html += '</div>';
            //append to div
            if (v.position.length < 1) {
                $(html).addClass('nhr').addClass('draggable').css({position: "relative"}).appendTo('div#nhr-devices-remain').click(function () {
                    nhr_info(v.type, v.address, v.shortMac);
                });
            } else {
                var position = v.position.split(",");
                $(html).addClass('nhr').addClass('draggable').css({position: "absolute", left: position[0] + 'px', top: position[1] + 'px'}).appendTo('div#floor1').click(function () {
                    nhr_info(v.type, v.address, v.shortMac);
                });
            }
        });
    });
}
function nhr_info(type, address, shortMac) {
    var cont = "", chk_status;
    switch (type) {
        case "00":  //unknown;
            break;
        case "02":  //STH-01ZB temp humidity sensor
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br/>';
            cont += '&nbsp;</div>';
            nhr_modal("溫濕度感測器", cont);
            break;
        case "03":  //STH-Mo2ZB temp humidity sensor
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br/>';
            cont += '&nbsp;</div>';
            nhr_modal("溫濕度感測器", cont);
            break;
        case "20":  //door electronic seal
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br/>';
            cont += '&nbsp;</div>';
            nhr_modal("門磁感應器", cont);
            break;
        case "26":  //motion_sensor
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br/>';
            cont += '&nbsp;</div>';
            nhr_modal("移動感測器", cont);
            break;
        case "41":  //S05-ST PT100 / soil temp sensor
        case "42":  //S05-SM soil moisture sensor
        case "45":  //S05-TH air-temp humidity sensor
        case "52":  //S05-LM leaf wetness sensor
        case "80":  //power meter
        case "a1":  //Single relay
        case "b1":  //Single PMW
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br/>';
            cont += '&nbsp;</div>';
            nhr_modal("尚未支援的裝置", cont);
            break;

        case "d0":  //A10 Siren
            cont = '<div>裝置ID：' + address + '</div>';
            cont += '<div><br /><button type="button" class="btn btn-default" onclick="javascript: doSend(\'sirenon\');">報警</button>';
            create_modal("A10震懾警鈴", cont);
            break;
        default:
            break;
    }
}
