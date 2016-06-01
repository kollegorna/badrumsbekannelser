$(function () {
  updateCharacterCount();
  $('#confession_body').keyup(updateCharacterCount);
  $('#confession_body').keydown(updateCharacterCount);

  function updateCharacterCount() {
    var cs = $('#confession_body').val().length;
    $('.character-count span').text(cs);
  }
});

