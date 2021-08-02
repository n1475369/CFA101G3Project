document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById("calendar");
    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale:'zh-tw',
        navLinks:true,
        headerToolbar:{
        //上方的左邊按鈕
        left:'prev,next,today',
        //上方中間顯示
        center:'title',
        //上方右邊按鈕
        right:'dayGridMonth,timeGridWeek,timeGridDay'
        },
        //加入活動
        events: {
                url: '../../calendar/getAllStrokeServlet',
                method: 'POST',
                extraParams: {
                //攝影
                action: 'photography'
                //場地
                // action: 'location'
                },
                failure: function() {
                    alert('there was an error while fetching events!');
                },
                color: '#eee',   // a non-ajax option
                textColor: 'black' // a non-ajax option
            }
        });
        calendar.render();
});