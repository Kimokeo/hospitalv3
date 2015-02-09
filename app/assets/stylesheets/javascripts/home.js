//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready( function() {

  console.log("Code loaded");

  $( ".first_name, .last_name, .description" ).blur(function() {
    console.log("Do some cool stuff here.");
    console.log(  $(this).val()  );
    if( $(".first_name").val() != "" && $(".last_name").val() != "" && $(".description").val() != "") {
      console.log("Remove disabled");
      $(".submit-things").removeClass('disabled');
    }    
  });
});