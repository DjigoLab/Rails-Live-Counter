jQuery(document).ready(function ($) {

    $(".accepts-negatives").find('label').click(function () {
        !$('#room_accepts_negative').prop('checked') ?
            $('#room_accepts_negative').prop('checked', true) :
            $('#room_accepts_negative').prop('checked', false);
    })

    $("#show-list").click(function () {
        $("#users-list").addClass('show')
    })
})