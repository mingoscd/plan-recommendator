$("#place_address").on('change', function(e){
	var city = $('input[name="place[city]"]').val();
	var address = $('input[name="place[address]"]').val();

	if(address.substring(0,8) == 'https://'){
		var coords = address.split("@")[1].split(",");
		$('input[name="place[lat]"]').val(coords[0]);
		$('input[name="place[lon]"]').val(coords[1]);
		query = coords[0]+","+coords[1];
		getAddressByLatLon(query);
	}else{
		var query = (address+" "+city).replace(/ /g,"+");
		getLatLonByAddress(query);
	}
});
function getLatLonByAddress(query){
	var data;
	var url = 'https://maps.googleapis.com/maps/api/geocode/json?address=';
	$.ajax({ dataType: "json", url: url+query, data: data, success: function(data){
			var lat = data.results[0].geometry.location.lat;
			var lon = data.results[0].geometry.location.lng;
			$('input[name="place[lat]"]').val(lat);
			$('input[name="place[lon]"]').val(lon);
		} 
	});
}
function getAddressByLatLon(query){
	var data;
	var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=';
	$.ajax({ dataType: "json", url: url+query, data: data, success: function(data){
		address = data.results[0].address_components[1].long_name +" "+ data.results[0].address_components[0].long_name;
		$('input[name="place[address]"]').val(address);
		$('input[name="place[city]"]').val(data.results[0].address_components[2].long_name);
		} 
	});
}