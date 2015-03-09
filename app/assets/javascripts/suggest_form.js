$(document).ready(function(){
	//resize background to container
	resizeBg();
	$(window).resize(function(){ resizeBg(); });

	//gradient in input range
	$(document).on('change','input[type="range"]',function(){
		var value = $(this).val();
		$(this).css('background-image','-webkit-linear-gradient(left, #15639F 0%, rgba(33, 150, 243, .6)'+value*20+'%, rgba(255,255,255,.5) '+value*20+'%)');
	});

	//fill user position in form
	(function(){
		navigator.geolocation.getCurrentPosition(function(e){
			$("#user_lat").val(e.coords.latitude);
			$("#user_lon").val(e.coords.longitude);
		});
	})();

});

function resizeBg(){
	var hei = window.innerHeight - 48;
	var min_hei = $(".suggest-form").height + 30;
	$(".suggest-content").css('height', hei+'px').css('min-height', min_hei+'px');
	$(".suggest-index-bg").css('height', hei+'px').css('min-height', min_hei+'px');		
}