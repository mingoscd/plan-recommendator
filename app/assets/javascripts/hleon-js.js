//Jquery
$(document).ready(function(){

	$(document).on('click', '#js-btn--burguer', function() {
	  $(this).toggleClass("js-active");
		toggleMenu();
		toggleShadow();
		toggleBlockScroll();
	});

	$(".over-lightbox").on('click', 'a, button, input[type=submit]', function(e){
		//add here animation to clicked element
		console.log(e);
		return false;
	});
	
	function toggleMenu(){
		$("#js-toggle-menu").toggleClass("js-toogle-menu");
	};
	function toggleBlockScroll(){
		$("body").toggleClass("js-block-scroll");
	}


	/* -----------------------------
	/*					LIGHTBOX
	/* -----------------------------
	/*
	/* The lightbox is used to put a shadow that puts in background some content. This feature has
	/* the option to add a class to the parent element to put over the lightbox and stay in foreground.
	/* Example to Toggle Lightbox Effect: <button onclick="toggleShadow()">Click me </button>
	/* Example element over lightbox: <nav class="over-lightbox">...</nav>
	/*
	/* ----------------------------- */ 

	function toggleShadow(){
		$("#js-lightbox").length ? removeLightbox() : createLightbox();
	}

	function createLightbox(){
		$(".over-lightbox").addClass("js-over-lightbox--active");
		$("body").append('<div id="js-lightbox" class="lightbox"></div>');
		$("#js-lightbox").addClass("js-lightbox--active");
	}
	function removeLightbox(){
		$("#js-lightbox").removeClass("js-lightbox--active");
		setTimeout(function(){ $(".over-lightbox").removeClass("js-over-lightbox--active")}, 500);
		$("#js-lightbox").remove();
	}


































});