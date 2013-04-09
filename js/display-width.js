$(document).ready(function() {
  // Optimalisation: Store the references outside the event handler:
  var $window = $(window);
  var $element = $('#window-width');

  function checkWidth() {
    var windowWidth = $window.width();
    $element.html(windowWidth);
  }
  // Execute on load
  checkWidth();
  // Bind event listener
  $(window).resize(checkWidth);
});