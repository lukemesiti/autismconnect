$(function() {
  $('.carousel').each(function() {
    $(this).carousel({
      interval: false
    });
  });
});


$(document).ready(function() {
    $(".welcome-icon-down a").smoothScroll();
}, 500)

$(document).ready(function() {
    $(".events-icon-down a").smoothScroll();
}, 500)

$(document).ready(function() {
  $(".icon-to-top a").smoothScroll();
})
