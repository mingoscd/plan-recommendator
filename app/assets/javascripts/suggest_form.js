// $(document).ready(function(){
// 	$('input[type="range"]').change(function(){
// 		switch(this.id){
// 			case 'tourist': textTourist($(this)); break;
// 			case 'relax': textRelax($(this)); break;
// 			case 'drink': textDrink($(this)); break;
// 			case 'money': textMoney($(this)); break;
// 		}
// 	});
// 	//fill user position in form
// 	(function(){
// 		navigator.geolocation.getCurrentPosition(function(e){
// 			$("#user_lat").val(e.coords.latitude);
// 			$("#user_lon").val(e.coords.longitude);
// 		});
// 	})();				
// });

// function textTourist(element){
// 	var description = element.siblings(".description");
// 	switch(element.val()){
// 		case "0": description.html("I already visited the city"); break;
// 		case "1": break;
// 		case "2": break;
// 		case "3": description.html('Let\'s do a tour around the city'); break;
// 		case "4": description.html('Let\'s do a tour around the city'); break;
// 		case "5": description.html('Visit all the places! <img src="http://troll.me/images/x-all-the-things/lets-do-this.jpg" style="display: inline; height: 70px; width: 100px; vertical-align: middle;">'); break;
// 	}
// }

// function textMoney(element){
// 	var description = element.siblings(".description");
// 	switch(element.val()){
// 		case "0": description.html("I don't need money to have fun"); break;
// 		case "1": break;
// 		case "2": break;
// 		case "3": description.html('I don\'t care about the money'); break;
// 		case "4": break;
// 		case "5": description.html('<img src="http://genophoria.files.wordpress.com/2012/11/shut-up-and-take-my-money.jpg" style="display: inline; height: 70px; width: 100px; vertical-align: middle;">'); break;
// 	}
// }