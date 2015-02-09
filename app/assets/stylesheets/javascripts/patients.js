//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function(){
  
  $('#submit-things').click(function(){
    validateForm();});
  $('error').delay(2000).fadeOut();

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
  

});