class PlacesController < ApplicationController
	#CRUD methods

	def index
		@places = Place.all
	end

	def show
		@place = Place.find params[:id]
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new place_params
		if @place.save
			redirect_to place_path(@place.id)
		else
			render 'new'
		end
	end

	def edit
		@place = Place.find params[:id]
	end

	def update
		@place = Place.find params[:id]
		if @place.update_attributes place_params
			flash[:notice] = "Place updated correctly"
			redirect_to home_path
		else
			render 'edit'
		end
	end

	def destroy
	end

	#other
	def search
	end

	def near
	end

	#private methods
	private

	def place_params
		params.require(:place).permit(:name, :city, :address, :lat, :lon, :price, :currency, :time, :type_of_site, :photo)
	end
end
