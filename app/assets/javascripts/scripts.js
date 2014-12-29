$(document).ready(function () {
  $("#toggler").click();

  setTimeout(function(){
    $('#flash_notice').remove();
  }, 5000);

  $('#create-pharmacy').click(function(){
    $('.add-pharm').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');

  }); 

});