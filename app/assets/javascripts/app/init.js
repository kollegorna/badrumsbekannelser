$(function () {
  var timerInterval;

  $(document).ready(function () {

    if($('.button--confession-edit').length) {
      $('.button--confession-edit').each(function() {
        var el = $(this);
        var time = el.attr('data-remaining-time');

        var percentage = 100 - time * 100 / 1800;

        el.find('.timer').css('width', percentage + '%');
        el.find('.info time').html(Math.round(time/60));

        timerInterval = setInterval(function() {
          if (time > 5) {
            time -= 5;
            percentage = 100 - time * 100 / 1800;
            el.find('.timer').animate({'width': percentage + '%'});
            el.find('.info time').html(Math.round(time/60));
          } else {
            clearInterval(timerInterval);
            el.remove();
          }
        }, 5000)
      });
    };
  });
});
