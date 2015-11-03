/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var weekDay = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
var weekDayEng = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'];
var markDate = 0;

$(function () {
    timer();
    //StartChineseTime();
    $('input.bulletin-input').attr("readonly", true);
    setTimeout(IsComfort(), 1000);
    //
});

function showDate() {
    var date = new Date();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    $('p#weekDay').text(weekDay[date.getDay()]);
    return ((m < 10) ? "0" + m : m) + "/"
            + ((d < 10) ? "0" + d : d) + " "
            ;
}

function showTime() {
    var date = new Date();
    var h = date.getHours();
    var m = date.getMinutes();
    var s = date.getSeconds();
    //return time
    return ((h < 10) ? "0" + h : h) + " : "
            + ((m < 10) ? "0" + m : m) + " : "
            + ((s < 10) ? "0" + s : s);
}

function changeBgByHour() {
    var date = new Date();
    var h = date.getHours();
    if (h > 18) {
        $('body').css("background-image", "url('images/bulletin/night-6pm-5am.jpg')");
    } else if (h > 16) {
        $('body').css("background-image", "url('images/bulletin/after-4pm-6pm.jpg')");
    } else if (h > 5) {
        $('body').css("background-image", "url('images/bulletin/sun-for-5am-4pm.jpg')");
    } else {
        $('body').css("background-image", "url('images/bulletin/night-6pm-5am.jpg')");
    }
}

function timer() {
    var date = new Date();
    $('p#fullYear').text(date.getFullYear() + "");
    $('input#date').val(showDate());
    $('input#time').val(showTime());

    setInterval(function () {
        $('input#date').val(showDate());
    }, 86400000);
    setInterval(changeBgByHour(), 3600000);
    setInterval(function () {
        $('input#time').val(showTime());
    }, 1000);
}

function IsComfort() {
    var CO2 = parseInt($('input#CO2').val());
    //$('#pbarCO2').progressbar({"value": CO2});
    if (CO2 > 1000) {
        $('#img-cloud').attr("src", "images/bulletin/cloud-full.gif");
    } else if (CO2 > 750) {
        $('#img-cloud').attr("src", "images/bulletin/cloud-4.gif");
    } else if (CO2 > 500) {
        $('#img-cloud').attr("src", "images/bulletin/cloud-3.gif");
    } else if (CO2 > 400) {
        $('#img-cloud').attr("src", "images/bulletin/cloud-2.gif");
    } else {
        $('#img-cloud').attr("src", "images/bulletin/cloud-1.gif");
    }

    var humid = parseInt($('input#humid').val());//40 60 80 100
    //$('#pbarHumid').progressbar({"value": humid});
    //summer time 40~80
    if (humid > 80) {
        $('#img-humid').attr("src", "images/bulletin/water-full.gif");
    } else if (humid > 60) {
        $('#img-humid').attr("src", "images/bulletin/water-4.gif");
    } else if (humid > 40) {
        $('#img-humid').attr("src", "images/bulletin/water-3.gif");
    } else if (humid > 30) {
        $('#img-humid').attr("src", "images/bulletin/water-2.gif");
    } else {
        $('#img-humid').attr("src", "images/bulletin/water-1.gif");
    }
}