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
    return ((m < 10) ? "0" + m : m) + " / "
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

function NumToChinese(num) {
    var words = ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"];
    return words[num];
}
