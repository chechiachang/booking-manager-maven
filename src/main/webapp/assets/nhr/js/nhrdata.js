/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var nhr_devices_type = {
    "da6d2": {"name": "temp_humid", "on": "fa fa-fw fa-spin fa-gear", "off": "fa fa-fw fa-gear fa-spin"},
    "d2117": {"name": "motion_sensor", "on": "fa fa-fw fa-bell", "off": "fa fa-fw fa-bell-slash"},
    "da246": {"name": "contact_sensor", "on": "fa fa-fw fa-lock", "off": "fa fa-fw fa-unlock"}
};


$(function () {
    setInterval(getNhrData, 1000);
});

function getNhrData() {

    //cause screen flash, which is bad
    //$('div#floor1').empty();

    //$('.nhr').remove();

    $.get("NhrDataJsonServlet", {cmd: "getdata"}, function (jsonResponse) {
        var datas = $.parseJSON(jsonResponse);
        $.each(datas, function (k, v) {
            var icon = "", data = "", iconClass;
            //switch by devices type
            switch (v.shortMac) {
                case "a6d2":    //temp humid
                    switch (v.clusterId) {
                        case "0402"://temp
                            data = v.data + "℃";
                            icon = nhr_devices_type.da6d2.on;
                            iconClass = "sensor";
                            break;
                        case "0405"://humid
                            data = v.data + "%";
                            icon = nhr_devices_type.da6d2.on;
                            iconClass = "sensor";
                            break;
                        default:
                            break;
                    }
                    break;
                case "2117":    //motion sensor
                    data = v.data;
                    if (data == "on") {//on / off = alert / safe
                        data = "偵測";
                        iconClass = "alert";
                    } else {
                        data = "安全";
                        iconClass = "on";
                    }
                    icon = nhr_devices_type.d2117.on;
                    break;
                case "a246":    //contact sensor
                    data = v.data;
                    if (data == "on") {//on / off = alert / safe
                        data = "偵測";
                        iconClass = "alert";
                    } else {
                        data = "安全";
                        iconClass = "on";
                    }
                    icon = nhr_devices_type.da246.on;
                    break;
                default:
                    break;
            }

            if (v.macClusterId.length > 0) {
                $('div#' + v.macClusterId).remove();
            }
            var html = '<div id="' + v.macClusterId +
                    '" shortmac="' + v.shortMac +
                    '" clusterid= "' + v.clusterId +
                    '" class= "nhr ' + iconClass +
                    '" data="' + data + '">' +
                    ' <div><i class="fa fa-fw ' + icon + '"></i></div>';
            html += '</br><ul><li>' + data + '</li></ul>';
            html += '</div>';
            //append to div
            var position = v.position.split(",");
            $(html).addClass('nhr').css({position: "absolute", left: position[0] + 'px', top: position[1] + 'px'}).appendTo('div#floor1');

        });
    });
}

function getNhrPosition() {
    //unsupported
}