var addBinders;

$(document).ready(function () {
  addBinders();
});

addBinders = function() {
  $('.menu-toggle').on('click', function() {
    $('body').toggleClass('open-menu');
    $('.navigation').fadeToggle();
  });

  $('.open-video').on('click', function() {
    var embedSrc = $('.video iframe').attr('src');
    if(embedSrc) {
      embedSrc = embedSrc.split("?");
      $(".video iframe").attr({
        "src": embedSrc[0] + "?autoplay=1"
      });

      $('body').removeClass('open-menu');
      $('.navigation').fadeOut();
      $('.video').fadeIn();
    }
  });

  $('.close-video').on('click', function() {
    var embedSrc = $('.video iframe').attr('src');
    if(embedSrc) {
      embedSrc = embedSrc.split("?");
      $(".video iframe").attr({
        "src": embedSrc[0] + "?autoplay=0"
      });
      $('.video').fadeOut();
    }
  });
}
