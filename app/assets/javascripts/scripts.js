$(document).ready(function () {
  $("#toggler").click();

  setTimeout(function(){
    $('#flash_notice').remove();
  }, 5000);

  $('#prescription_drug_id').change(function() {
    value = $(this).val()
    alert(value)
  });

  $('#create-new-drug').click(function(){
    $('#prescription_drug_id').toggle();
    $('#choose-drug').hide();
    $('#create-new-drug').toggle();
    $('.add-new-drug').toggle();
  }); 

  $('#create-new-doc').click(function(){
    $('#prescription_doctor_id').toggle();
    $('#choose-doc').hide();
    $('#create-new-doc').toggle();
    $('.add-new-doc').toggle();
  }); 

  $('#add-pharm-address').click(function(){
    $('#add-address').toggle();
    $(this).remove();
  }); 

  $('#create-pharmacy').click(function(){
    $('#filling_pharmacy_id').toggle();
    $('#choose-or').toggle();
    $('.add-pharm').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
  }); 

});