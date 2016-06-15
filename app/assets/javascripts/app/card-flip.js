var cardDelays = [
  40,
  0,
  30,
  5,
  58,
  14,
  48,
  6,
  60,
  36,
  10,
  54,
  44,
  8
];
var cardDuration = 20;
var totalDuration = 80;
var cardInterval, cardFlip;

cardInterval = function(card, delay) {
  setTimeout(cardFlip, delay, card);
  delay += (cardDuration + Math.round(Math.random()*10)) * 1000;
  setTimeout(cardFlip, delay, card);
}

cardFlip = function(card) {
  card.toggleClass('open');
}

$(document).ready(function () {

  $('.cell.confession').each(function(index) {
    var card = $(this);
    var delay = cardDelays[index] * 1000;
    cardInterval(card, delay);
    setInterval(cardInterval, totalDuration * 1000, card, delay);
  });
});
