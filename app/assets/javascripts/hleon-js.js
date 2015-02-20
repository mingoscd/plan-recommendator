//Jquery
$(document).ready(function(){

	// Button Burguer animation
	$("#js-btn--burguer").click(function() {
	  	$(this).toggleClass("js-active");
		toggleMenu();
		toggleShadow();
		toggleBlockScroll();
	});
	
	function toggleMenu(){
		$("#js-toggle-menu").toggleClass("js-toogle-menu");
	};
	function toggleShadow(){
		$("#js-lightbox").toggleClass("js-lightbox--active");
	}
	function toggleBlockScroll(){
		$("body").toggleClass("js-block-scroll");
	}

































});