//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function(){
  $('#submit-things').click(function(){
    validateForm();
  });
  $('error').delay(2000).fadeOut();
});

function validateForm(){

  var first_name = $('#validate_first_name').val();
  var last_name = $('#validate_last_name').val();
  var description = $('#validate_description').val();
  if (first_name == ""){
    $('#validate_first_name').after('Name required')
  }
  if (last_name == ""){
    $('#validate_last_name').after('Yes, last name too')
  }
  if (description == ""){
    $('#validate_description').after('Description required')
	}
  }

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


$(document).on('click', '.wait', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "waiting_room"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
    dataType: 'script'
  });
});

$(document).on('click', '.exam', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "checkup"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
    dataType: 'script'
  });
});

$(document).on('click', '.scan', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "xray"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
    dataType: 'script'
  });
});

$(document).on('click', '.operation', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "surgery"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
    dataType: 'script'
  });
});

$(document).on('click', '.checkout', function(){
  var patient_id = $(this).attr("billing");
  var state = {workflow_state: "waiting_room"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
    dataType: 'script'
  });
});

$(document).on('click', '.leave', function(){
  var patient_id = $(this).attr("patient_id");
  var state = {workflow_state: "discharged"};
  $.ajax({
    type: 'PATCH',
    url:'/patients/' + patient_id,
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