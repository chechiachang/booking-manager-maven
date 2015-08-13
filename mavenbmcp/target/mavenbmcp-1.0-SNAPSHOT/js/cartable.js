/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
//page initialize
    IsAdmin();
    $('select#repeatSelect').change(function () {
        SetRepeatUntilDatepicker();
    });
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    // page is now ready, initialize the calendar...
    $('#calendar').fullCalendar({
// put your options and callbacks here
        height: 'auto',
        lang: 'zh-tw',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,resourceDay'
        },
        defaultView: 'agendaWeek',
        timezone: 'local',
        businessHour: {
            start: '09:00', // a start time (10am in this example)
            end: '18:00', // an end time (6pm in this example)
            dow: [1, 2, 3, 4, 5]
                    // days of week. an array of zero-based day of week integers (0=Sunday)
                    // (Monday-Thursday in this example)
        },
        eventLimit: true, // allow "more" link when too many events
        resources: 'EventJsonServlet?cmd=objects',
        events: 'EventJsonServlet?cmd=get',
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
                $('#calendar').fullCalendar('unselect');
                alert("無法登記以前的時間");
            } else if (!LoginValidate()) {
                $('#calendar').fullCalendar('unselect');
                alert("請先登入");
            } else {
                //set createdBy = login user
                $('input#createdBy').val($('input#loginuser').val());
                SetDatepicker($('input#startDatepicker'), start);
                SetDatepicker($('input#endDatepicker'), start);
                initLoadTimeSelect($('select#startTimeSelect'));
                initLoadTimeSelect($('select#endTimeSelect'));
                SetRepeatUntilDatepicker();
                SetTimeSelect($('select#startTimeSelect'), start);
                SetTimeSelect($('select#endTimeSelect'), end);
                initLoadObjectSelect($('select#objectSelect'));
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
             $.post('../EventJsonServlet', {cmd: "resize", id: event.id, start: event.start, end: event.end});
             } else {
             revertFunc();
             }
             */

        }
    });
});//$(function)
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
}

function initLoadObjectSelect(target) {
    $.get('EventJsonServlet', {cmd: "objects"}, function (jsonResponse) {
        target.find('option').remove();
        var json = JSON.parse(jsonResponse);
        for (var i = 0; i < json.length; i++) {
            $('<option>').val(json[i].id).text(json[i].name).appendTo(target);
        }
    });
}

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
    if (!(startDate.getDate() < today.getDate())) {
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
        $.post('EventJsonServlet', {cmd: "delete", uId: $('input#uId').val()});
        setTimeout(function () {
            window.location = "index.jsp";
        }, 500);
    } else {

    }
}

function SendPost() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("POST", "EventJsonServlet", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("fname=Henry&lname=Ford");
}

function postToUrl(path, params, method) {
    method = method || "post"; //Set method to post by default, if not specified.
    var form = document.createElement("hiddenForm");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for (var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}
//postToUrl('http://example.com/', {'q':'a'});