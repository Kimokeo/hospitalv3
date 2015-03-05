//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function(){
  $('.submit-things').prop('disabled', true);
  $('.validate_field').change(function(){
    var first_name = $(".validate_field:first").val();
    var last_name = $(".validate_field:last").val();
    if (first_name != "" || last_name != "") {
      $('.submit-things').prop('disabled', false);
    }
    if (first_name == "" || last_name == "") {
      $('.submit-things').prop('disabled', true);
    }
  })

  $(".alert").fadeOut(6000);
  $(".notice").fadeOut(6000);

  var first_name = $('.validate_first_name').val();
  var last_name = $('.validate_last_name').val();
  var description = $('.validate_description').val();
  if (first_name == ""){
    $('.validate_first_name').after('Name required')
  }
  if (last_name == ""){
    $('.validate_last_name').after('Yes, last name too')
  }
  if (description == ""){
    $('.validate_description').after('Description required')
  }
  
  $('.validate_field').keyup(function(){
    var  var first_name = $('.validate_first_name').val();
    var last_name = $('.validate_last_name').val();
    var description = $('.validate_description').val();
    if (first_name == "") {
      $('.validate_first_name').hide();
    }
    else {
      $('.validate_first_name').show();
    }

    if (first_name == "") {
      $('.validate_last_name').hide();
    }
    else {
      $('.validate_last_name').show();
    }

    if (first_name == "") {
      $('.validate_description').hide();
    }
    else {
      $('.validate_description').show();
    }
  });
// $(function() {
//   $(".patients th a, .patients .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });
//   $(".search_results input").keyup(function() {
//     $.get($(".search_results").attr("action"), $(".search_results").serialize(), null, "script");
//     return false;
//   });
// });


$(document).on('click', '.waiting_room_patient', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "waiting_room"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/waiting_room_patient',
    dataType: 'script'
  });
});

$(document).on('click', '.exam_patient', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "checkup"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/checkup_patient',
    dataType: 'script'
  });
});

$(document).on('click', '.scan_patient', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "xray"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/xray_patient',
    dataType: 'script'
  });
});

$(document).on('click', '.operation_patient', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "surgery"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/surgery_patient',
    dataType: 'script'
  });
});

$(document).on('click', '.checkout_patient', function(){
  var patient_id = $(this).attr("billing");
  var state = {workflow_state: "checkout"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/billing_patient',
    dataType: 'script'
  });
});

$(document).on('click', '.leave_patient', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "discharged"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + 'patient_id' + '/discharged_patient',
    dataType: 'script'
  });
});

console.log("hello");
$(document).on('click', '.submit_search', function(){
  console.log("test")
  var search = $(".search_patients").val()
  $.ajax({
    'type': 'GET',
    'url': '/patients' + '/search_results',
    'datatype': 'script',
    'data': {q: search}
  });
})