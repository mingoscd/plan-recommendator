//Jquery
$(document).ready(function(){
	$(document).on('click', '#js-btn--burguer', function() {
	  $(this).toggleClass("js-active");
	  var transitionTime = 700;
		toggleShadow(transitionTime);
		toggleMenu(transitionTime);
		toggleBlockScroll();
	});

	$(".js-over-lightbox").on('click', 'a, button, input[type=submit]', function(e){
		//add here animation to clicked element
		//use e.offsetX y e.offsetY to center the animation in the point clicked
	});
	
	function toggleMenu(transitionTime){
		$("#js-toggle-menu").css('transition', transitionTime+'ms')
												.toggleClass("js-toogle-menu");
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
	/* Example element over lightbox: <nav class="js-over-lightbox">...</nav>
	/*
	/* ----------------------------- */ 

	function toggleShadow(transitionTime){
		$("#js-lightbox").length ? removeLightbox(transitionTime) : createLightbox(transitionTime);
	}

	function createLightbox(transitionTime){
		$(".js-over-lightbox").toggleClass("js-over-lightbox--active");
		$("body").append('<div id="js-lightbox" class="lightbox"></div>');
		$("#js-lightbox").fadeTo(transitionTime, .4).toggleClass("js-lightbox--active");
	}
	function removeLightbox(transitionTime){
		setTimeout(function(){ 
			$(".js-over-lightbox").removeClass("js-over-lightbox--active");
			$("#js-lightbox").remove();
		}, transitionTime);
		$("#js-lightbox").fadeTo(transitionTime,0);
	}

































});