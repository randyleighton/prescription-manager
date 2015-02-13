$(document).ready(function () {
  $("#toggler").click();

  setTimeout(function(){
    $('#flash_notice').remove();
  }, 5000);

  $('#prescription_drug_id').change(function() {
    value = $('#prescription_drug_id option:selected').text()
    if (value !== "Choose from your list") {
      $(".add-new-drug").remove();
      $('#choose-drug').hide();
      $('#create-new-drug').toggle();
    }
  });

  $('#prescription_doctor_id').change(function() {
    value = $('#prescription_doctor_id option:selected').text()
    if (value !== "Choose from your list") {
      $('.add-new-doc').remove();
      $('#choose-doc').hide();
      $('#create-new-doc').toggle();
    }
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
    $("#prescription_doctor_attributes_name").val("");
    $("#prescription_doctor_attributes_practice_name").val("");
    $("#prescription_doctor_attributes_email").val("");
    $("#prescription_doctor_attributes_office_phone").val("");
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