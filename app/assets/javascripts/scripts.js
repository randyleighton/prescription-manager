$(document).ready(function () {
  $("#toggler").click();

  setTimeout(function(){
    $('#flash_notice').remove();
  }, 5000);

  $('#create-pharmacy').click(function(){
    $('.add-pharm').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
  }); 

  $('#create-drug').click(function(){
    $('.add-drug').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
  }); 

  $('#add-pharm-address').click(function(){
    $('#add-address').toggle();
    $(this).remove();
  }); 

});