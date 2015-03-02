// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('click','.toggleLogin',function(){
	$("#login-form, #login-form-social").toggleClass("js-fadeInRight--active");
	$(".intro").toggle();
	return false;
});
