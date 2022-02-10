
window.onload = function() {
  var aFormElement = document.getElementById("myForm");
  aFormElement.querySelectorAll('input:not([type=hidden])')[0].focus();
}