$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $('#link-to-top').fadeIn();
        } else {
            $('#link-to-top').fadeOut();
        }
    });
    $('#link-to-top').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 400);
        return false;
    });
});