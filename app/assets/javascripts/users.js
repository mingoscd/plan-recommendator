// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//edit user form
$(document).ready(function(){
	$('input[type="file"]').change(function(){
		$(this).siblings("label").addClass("success-upload");
	})
});
