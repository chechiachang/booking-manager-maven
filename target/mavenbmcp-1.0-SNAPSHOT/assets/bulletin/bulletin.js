/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var weekDay = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
var weekDayEng = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'];
var markDate = 0;

$(function () {
    initProgressBar();
    timer();
    //StartChineseTime();
    $('input').attr("readonly", true);
    setTimeout(IsComfort(), 1000);

    //
});

function showDate() {
    var date = new Date();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    $('input#weekDay').val(weekDay[date.getDay()]);
    return date.getFullYear() + " / "
            + ((m < 10) ? "0" + m : m) + " / "
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

function timer() {
    var date = new Date();
    $('input#date').val(showDate());
    $('input#time').val(showTime());

    setInterval(function () {
        $('input#date').val(showDate());
    }, 86400000);
    setInterval(function () {
        $('input#time').val(showTime());
    }, 1000);
}

function StartChineseTime() {
    var date = new Date();
    //Fullyear to ROC chinese year
    var ROCYearNumbers = (date.getFullYear() - 1911).toString().split("");
    var ROCYearOutput = "";
    for (var i = 0; i < ROCYearNumbers.length; i++) {
        ROCYearOutput += NumToChinese(ROCYearNumbers[i]);
    }
    $('input#fullYear').val(ROCYearOutput);

    $('input#month').val(NumToChinese(date.getMonth() + 1));
    //cal date to chinese date
    var dateNumbers = (date.getDate().toString().split(""));
    var dateOutput = "";
    for (var i = 0; i < dateNumbers.length; i++) {
        dateOutput += NumToChinese(dateNumbers[i]);
    }
    $('input#date').val(dateOutput);


    $('input#weekDay').val(weekDay[date.getDay()]);
    $('input#hours').val(date.getHours());
    $('input#minutes').val(date.getMinutes());

    var s = date.getSeconds();
    $('input#seconds').val(s);

    setInterval(function () {
        s += 1;
        if (s == 60) {
            s = 0;
            //fade only info block
            $('body').fadeOut('fast', function () {
                date = new Date();
                $('input#hours').val(date.getHours());
                $('input#minutes').val(date.getMinutes());
                $('body').fadeIn('fast');
            });
            //window.location.href = "room.jsp";
        }
        $('input#seconds').val(s);
    }, 1000);
}

function IsComfort() {
    var CO2 = parseInt($('input#CO2').val());
    $('#pbarCO2').progressbar({"value": CO2});
    if (CO2 > 1000) {
        $('input#CO2Comfort').val("CO2濃度過高");
        $('div#CO2BadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#CO2BadgeContainer div:nth-child(2)').addClass("color-badge-active");
        $('input#CO2Comfort').addClass("comfort-red");

    } else if (CO2 > 750) {
        $('input#CO2Comfort').val("CO2濃度偏高");
        $('div#CO2BadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#CO2BadgeContainer div:nth-child(3)').addClass("color-badge-active");
        $('input#CO2Comfort').addClass("comfort-redyellow");
    } else if (CO2 > 500) {
        $('input#CO2Comfort').val("空氣品質尚可");
        $('div#CO2BadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#CO2BadgeContainer div:nth-child(4)').addClass("color-badge-active");
        $('input#CO2Comfort').addClass("comfort-yellow");
    } else if (CO2 > 400) {
        $('input#CO2Comfort').val("空氣品質尚可");
        $('div#CO2BadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#CO2BadgeContainer div:nth-child(5)').addClass("color-badge-active");
        $('input#CO2Comfort').addClass("comfort-ryellowgreen");
    } else {
        $('input#CO2Comfort').val("空氣品質良好");
        $('div#CO2BadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#CO2BadgeContainer div:nth-child(6)').addClass("color-badge-active");
        $('input#CO2Comfort').addClass("comfort-green");
    }

    var humid = parseInt($('input#humid').val());//40 60 80 100
    $('#pbarHumid').progressbar({"value": humid});
    //summer time 40~80
    if (humid > 80) {
        $('input#humidComfort').val("環境濕度過高");
        $('div#THBadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#THBadgeContainer div:nth-child(6)').addClass("color-badge-active");
        $('input#humidComfort').addClass("comfort-red");
    } else if (humid > 60) {
        $('input#humidComfort').val("環境較為潮濕");
        $('div#THBadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#THBadgeContainer div:nth-child(5)').addClass("color-badge-active");
        $('input#humidComfort').addClass("comfort-yellow");
    } else if (humid > 40) {
        $('input#humidComfort').val("環境濕度適中");
        $('div#THBadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#THBadgeContainer div:nth-child(4)').addClass("color-badge-active");
        $('input#humidComfort').addClass("comfort-green");
    } else if (humid > 30) {
        $('input#humidComfort').val("環境較為乾燥");
        $('div#THBadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#THBadgeContainer div:nth-child()').addClass("color-badge-active");
        $('input#humidComfort').addClass("comfort-yellow");
    } else {
        $('input#humidComfort').val("環境過於乾燥");
        $('div#THBadgeContainer div.color-badge').removeClass("color-badge-active");
        $('div#THBadgeContainer div:nth-child(2)').addClass("color-badge-active");
        $('input#humidComfort').addClass("comfort-red");
    }
}

function NumToChinese(num) {
    var words = ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"];
    return words[num];
}
function initProgressBar() {
    // four progress bars
    $("#pbarCO2").progressbar({
        "value": 500,
        "max": 1000
    });
    $("#pbarHumid").progressbar({
        "value": 50,
        "max": 100
    });

    // the zero'th progressbar gets the default theme

    // set colors for progressbar #1
    //$("#pbarCO2").css({'background': 'url(images/white-40x100.png) #ffffff repeat-x 50% 50%;'});
    //$("#pbarCO2 > div").css({'background': 'url(images/lime-1x100.png) #cccccc repeat-x 50% 50%;'});

    // set colors for progressbar #2
    $("#pbarHumid").css({'background': 'Gray'});
    $("#pbarHumid > div").css({'background': 'Orange'});

    // set colors for progressbar #3
    $("#pbarCO2").css({'background': 'Gray'});
    $("#pbarCO2 > div").css({'background': 'Orange'});
}