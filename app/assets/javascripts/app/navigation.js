var addBinders;

$(document).ready(function () {
  addBinders();
});

addBinders = function() {
  $('.menu-toggle').on('click', (function() {
    $('body').toggleClass('open-menu');
    $('.navigation').fadeToggle();
  }));
}
