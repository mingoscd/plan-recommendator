class SuggestsController < ApplicationController
	def index
	end

	def search
		@city = params[:place][:city]
		point_lat = params[:user_lat].to_f
		point_lon = params[:user_lon].to_f
		@preferences = get_preferences params

		#generar punto de partida (cercano)
		#init parameters
		@plan = []
		i = 0 
		step = 0 
		while i == 0  do
   		step += 0.01
   		range_lat = (point_lat - step) .. (point_lat + step)
   		range_lon = (point_lon - step) .. (point_lon + step)
   		point = generate_begin_point(range_lat,range_lon)
   		i = point.count
		end
		@plan << point.sample

		#otros puntos de interes cercanos en bucle (4-5)

		#incluir lugar de descanso

		#mooore

		render 'search'
	end

	private

	def get_preferences params
		rejected_keys = ["utf8", "authenticity_token", "place", "user_lat", "user_lon", "commit", "controller", "action"]
		params.reject do |key, value|
			rejected_keys.include? key
		end
	end

	def generate_begin_point range_lat, range_lon
		type = get_type_begining
		Place.where(city: @city).where(type_of_site: type).where(lat: range_lat).where(lon: range_lon)
	end

	def get_type_begining
		if @preferences[:tourist].to_i >= 2
			x = ["Monument", "Museum", "Other"] 
		elsif @preferences[:relax].to_i >= 2 
			x = ["Park", "Cafe", "Beautiful Place", "Beach"]
		elsif @preferences[:drink].to_i >= 3 
			x = ["Bar", "Disco", "Party"]
		else
			x = ["Monument", "Park", "Other", "Beautiful Place"] 
		end
		x
	end
end
