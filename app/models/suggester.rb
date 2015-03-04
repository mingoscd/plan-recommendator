class Suggester
	def initialize(params)
		@params = params
	end

	def params
		@params
	end

	def result
		point_lat = params[:user_lat].to_f
		point_lon = params[:user_lon].to_f
		@plan = []
		@city = params[:place][:city]
		@preferences = get_preferences params

		@cultural_types = ["Monument", "Museum", "Other"]
		@relax_types = ["Park", "Cafe", "Beautiful Place", "Beach"]
		@drink_types = ["Bar", "Disco", "Party"]

		#special case: tourism 0, relax 0, only drink
		if @preferences[:tourist].to_i == 0 && @preferences[:relax].to_i == 0 && @preferences[:drink].to_i > 0
			get_type "Bar", @preferences[:money], point_lat, point_lon
		elsif @preferences[:tourist].to_i > 3
			get_type @cultural_types, @preferences[:money], point_lat, point_lon
		else
			tourist = get_type @cultural_types, @preferences[:money], point_lat, point_lon	
			relax = get_type @relax_types, @preferences[:money], point_lat, point_lon	
			drink = get_type @drink_types, @preferences[:money], point_lat, point_lon
			@plan = [];
			4.times do			
				@plan << tourist.shuffle!.pop
				@plan << relax.shuffle!.pop
				@plan << drink.shuffle!.pop
			end	
		end
		@plan = @plan.compact.uniq.take(10)
	end

	def get_preferences params
		rejected_keys = ["utf8", "authenticity_token", "place", "user_lat", "user_lon", "commit", "controller", "action"]
		params.reject do |key, value|
			rejected_keys.include? key
		end
	end

	def get_type(type, money, point_lat, point_lon)
		step = 0.05
		range_lat = (point_lat - step) .. (point_lat + step)
		range_lon = (point_lon - step) .. (point_lon + step)
		price = money.to_i > 3 ? "price DESC" : "price ASC"
		places = Place.where(city: @city, type_of_site: type, lat: range_lat, lon: range_lon)
									.order(price).limit(10)
		places.each do |place|
			@plan << place
		end
	end
end