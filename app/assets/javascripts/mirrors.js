// -----------------------------------------------------------------------------
// JS for the Mirrors…
// -----------------------------------------------------------------------------
//
//
// -----------------------------------------------------------------------------
// Libraries
// -----------------------------------------------------------------------------
//= require jquery

$(document).ready(function() {

   var j = 0;
   var delay = 2000; //millisecond delay between cycles
   function cycleThru(){
           var jmax = $(".confessions p").length -1;
           $(".confessions p:eq(" + j + ")")
                   .animate({"opacity" : "1"} ,400)
                   .animate({"opacity" : "1"}, delay)
                   .show().animate({"opacity" : "0"}, 400, function(){
                           (j == jmax) ? j=0 : j++;
                           cycleThru();
                           $(this).hide();
                   });
           };

   cycleThru();

 });
