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
           var jmax = $(".mirror p").length -1;
           $(".mirror p:eq(" + j + ")")
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
