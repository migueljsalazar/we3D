$(document).on('ready page:load', function() {
    $( "#datepicker" ).datepicker({ minDate: 1, maxDate: "+1M +10D", dateFormat: 'D,  M dd yy'});
});
