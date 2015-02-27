class SuggestsController < ApplicationController
	def index
	end

	def search
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
			get_near_bars point_lat, point_lon
		else
			#init parameters
			i , step = 0 , 0
			while i == 0  do
	   		step += 0.008
	   		range_lat = (point_lat - step) .. (point_lat + step)
	   		range_lon = (point_lon - step) .. (point_lon + step)
	   		point = generate_begin_point(range_lat,range_lon)
	   		i = point.count
			end
			@plan << point.sample
			#if time is filled could be an option
			5.times do 
				point_lat = @plan.last.lat.to_f
				point_lon = @plan.last.lon.to_f
				step , i = 0 , 0
				while i == 0  do
		   		step += 0.002
		   		range_lat = (point_lat - step) .. (point_lat + step)
		   		range_lon = (point_lon - step) .. (point_lon + step)
		   		point = generate_random_point(range_lat,range_lon)
		   		#check no repeated places
		   		if point.count > 0
			   		place = point.sample
			   		unless @plan.collect { |p| p.name }.include? place.name 
			   			i = point.count
			   		end
			   	end
				end
			@plan << place
			end

		end
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

	def generate_random_point range_lat, range_lon
		type = get_type_random
		Place.where(city: @city).where(type_of_site: type).where(lat: range_lat).where(lon: range_lon)
	end

	def get_type_begining
		if @preferences[:tourist].to_i >= 2
			x = @cultural_types
		elsif @preferences[:relax].to_i >= 2 
			x = @relax_types
		elsif @preferences[:drink].to_i >= 3 
			x = @drink_types
		else
			x = ["Monument", "Park", "Other", "Beautiful Place"] 
		end
		x
	end

	def get_type_random
		# get number of type of sites planned of each
		tourist,relax,drink = 0,0,0
		@plan.map do |item|
			tourist += 1 if @cultural_types.include? item.type_of_site
			relax += 1 if @relax_types.include? item.type_of_site
			drink += 1 if @drink_types.include? item.type_of_site
		end
		#new sizes to choose
		tourist = @preferences[:tourist].to_f - (tourist * Random.rand)
		relax = @preferences[:relax].to_f - (relax * Random.rand)
		drink = @preferences[:drink].to_f - (drink * Random.rand)
		x = Random.rand((tourist + relax + drink).abs)
		if x <= tourist
			return @cultural_types
		elsif x <= tourist + relax 
			return @relax_types
		else
			return @drink_types
		end
	end

	def get_near_bars point_lat, point_lon
		step = 0.01
		range_lat = (point_lat - step) .. (point_lat + step)
		range_lon = (point_lon - step) .. (point_lon + step)
		places = Place.where(city: @city).where(type_of_site: "Bar")
									.where(lat: range_lat).where(lon: range_lon)
									.order("price ASC").limit(10)
		places.each do |place|
			@plan << place
		end
		debugger
		p @plan
	end
end
