$(document).ready(function () {
  $("#toggler").click();

  setTimeout(function(){
    $('#flash_notice').remove();
  }, 5000);


  $('#create-new-drug').click(function(){
    $('#prescription_drug_id').toggle();
    $('#choose-or').toggle();
    $('#create-new-drug').toggle();
    $('.add-new-drug').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
  }); 

  $('#add-pharm-address').click(function(){
    $('#add-address').toggle();
    $(this).remove();
  }); 

  // $('#filling_pharmacy_id').click(function() {
  //   event.preventDefault;
  //   alert("selection element clicked");
  //   $('#create-pharmacy').toggle();
  // })

  $('#create-pharmacy').click(function(){
    // $('#filling_pharmacy_id').children().remove().end().append('<option selected value="Choose Existing Pharmacy">Choose Existing Pharmacy</option>') ;

    // $('form#new_filling').find('filling[pharmacy_id]').removeAttr('selected');

    // $("select[name='filling_pharmacy_id']").find("option[value='Choose an Existing Pharmacy']").attr("selected","selected");

    $('#filling_pharmacy_id').toggle();
    $('#choose-or').toggle();
    $('.add-pharm').toggle();
    $('#iconChange').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
  }); 

});