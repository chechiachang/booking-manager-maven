/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var wulian_devices_type = {
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
var nhr_devices_type={
    
};


$(function () {
    setInterval(getNhrData, 1000);
});

function getNhrData() {

    //cause screen flash, which is bad
    //$('div#floor1').empty();

    $('.nhr').remove();

    $.get("NhrDataJsonServlet", {cmd: "getdata"}, function (jsonResponse) {
        var data = $.parseJSON(jsonResponse);
        $.each(data, function (k, v) {
            var icon = "";
            //switch by devices type
            switch (v.shortMac) {
                case "a6d2":    //0405 Zigbee Cluster Library relative humid measurement Cluster ID
                    break;
                case "2117":    //0405 Zigbee Cluster Library temperature measurement Cluster ID
                    break;
                case "a246":    //0405 Zigbee Cluster Library temperature measurement Cluster ID 
                    break;
            }
            
            if (v.macClusterId.length > 0) {
                $('div#'+v.macClusterId).remove();
            }
            var html = '<div id=' + v.macClusterId +
                    '" shortmac="' + v.shortMac +
                    '" clusterid= "' + v.clusterId +
                    '" data="' + v.data + '">"' +
                    '"<div><i class="fa fa-fw ' + icon + '"></i></div>';
            html += '</br>' + v.data;
            html += '</div>';
            //append to div
            var position = v.position.split(",");
            $(html).addClass('ico-mode').addClass('nhr').css({position: "relative", left: position[0] + 'px', top: position[1] + 'px'}).appendTo('div#floor1');

        });
    });
}

function getNhrPosition() {
    //unsupported
}