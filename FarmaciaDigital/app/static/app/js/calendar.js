$(document).ready(function() {
    $('#calendario').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      defaultView: 'month',
      editable: true,
      eventLimit: true,
      events: [
        {
          title: 'Evento 1',
          start: '2023-06-01',
          end: '2023-06-03'
        },
        {
          title: 'Evento 2',
          start: '2023-06-07',
          end: '2023-06-10'
        },
        // ... Agrega más eventos si es necesario ...
      ]
    });
  });