$(document).ready(function() {

  $(window).scroll(function () {
      console.log($(window).scrollTop())
    if ($(window).scrollTop() > 200) {
      $('#header').addClass('header-fixed animated slideInDown');
      $('#header-bar').fadeIn().addClass('animated slideInDown');
    }
    if ($(window).scrollTop() < 5)  {
      $(".header-fixed").removeClass('header-fixed animated slideInDown');
      $('#header-bar').fadeOut().remmoveClass('animated slideInDown');
    }
  });
});

function run(interval, frames) {
    var int = 1;

    function func() {
        document.getElementById("landpage").className = "b"+int;
        int++;
        if(int === frames) { int = 1; }
    }

    var swap = window.setInterval(func, interval);
}

run(3000, 4); //milliseconds, frames
