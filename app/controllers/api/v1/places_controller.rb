module Api
	module V1
		class PlacesController < ApplicationController

			after_action :set_access_control_headers

			def near
				step = { lat: 0.02, lon: 0.02 }
				range_lat = (params[:lat].to_f - step[:lat]) .. (params[:lat].to_f + step[:lat])
				range_lon = (params[:lon].to_f - step[:lon]) .. (params[:lon].to_f + step[:lon])

				places = Place.where(lat: range_lat).where(lon: range_lon)
		    result = places.map do |place|
		      {}.tap do |place_hash|
		        place_hash[:name] = place.name
		        place_hash[:photo] = place.photo
		        place_hash[:address] = place.address
		        place_hash[:lat] = place.lat
		        place_hash[:lon] = place.lon
		        place_hash[:rate] = place.rate
		        place_hash[:price] = place.price
		        place_hash[:currency] = place.currency
		        place_hash[:type_of_site] = place.type_of_site
		      end
		    end
		    render json: result
			end

			def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = "*"
        headers['Access-Control-Request-Method'] = "GET"
      end

		end
	end
end