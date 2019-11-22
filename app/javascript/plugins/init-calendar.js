import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';


import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';
//import '@fullcalendar/timegrid/main.css';
//import '@fullcalendar/list/main.css';

function initCalendar(){
  document.addEventListener('DOMContentLoaded', function() {
    console.log('yay')
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin ],
      events: '/api/v1/events',
      eventClick: function(info) {
        alert(info.event);
      },
      firstDay: 1

    });

    calendar.render();
  });
}

export { initCalendar }
