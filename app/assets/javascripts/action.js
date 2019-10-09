jQuery(document).ready(function($) {

    $(".accepts-negatives").click(function() {
        !$('#room_accepts_negative').prop('checked') ?
            $('#room_accepts_negative').prop('checked', true) :
            $('#room_accepts_negative').prop('checked', false);
    })

})