class SuggestsController < ApplicationController
	def index
	end

	def search
		@city = params[:place][:city]
		preferences = get_preferences params
		@places = []
		@plan = []
		# tourist: 0 if 0, 1 if >=1, 2 if >=3, 3 if 5, suggest monuments (close each other)
		# the number of places follows a linear expresion (x+1)/2 , posible change: exponential
		suggest_tourist preferences
		
		# relax: 1 park and 1 nice place (close to the park)
		suggest_relax preferences
		
		# dancing .....

		#drink: 1-2 suggest nice places, 3-5 suggest cheap places
		suggest_drink preferences 

		@places.each do |i|
			i.each do |place|
				@plan << place
			end
		end
		@plan.sort_by { rand }
		render 'search'
	end

	private

	def get_preferences params
		rejected_keys = ["utf8", "authenticity_token", "place", "commit", "controller", "action"]
		params.reject do |key, value|
			rejected_keys.include? key
		end
	end

	def generate_plan
		Place.where(city: @city).order("RANDOM()")
	end

	def suggest_tourist preferences
		@places << suggest_monuments( (preferences[:tourist].to_i+1)/2 )
		@places << suggest_beauty(1) 
	end

	def suggest_relax preferences
		@places << suggest_park(1) if preferences[:relax].to_i > 0
		@places << suggest_beauty(1) if preferences[:relax].to_i > 2 && preferences[:tourist].to_i < 3
	end

	def suggest_drink preferences
		@places << suggest_bar(1) if preferences[:drink].to_i > 0
	end

	#submethods
	def suggest_monuments number
		generate_plan.where(type_of_site: "Monument").limit(number)
	end

	def suggest_park number
		generate_plan.where(type_of_site: "Park").limit(number)
	end

	def suggest_beauty number
		generate_plan.where(type_of_site: "Food/Restaurant").limit(number)
	end

	def suggest_bar number
		generate_plan.where(type_of_site: "Bar").limit(number)
	end
end
