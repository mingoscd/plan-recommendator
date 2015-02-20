require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
	#control all routes, must be logged
	#control all routes, must be logged
	#control all routes, must be logged
	describe "GET #index" do 
		it "render the index template" do 
			get :index
			expect(response).to render_template("index")
		end

		it "responds with the correct array of places" do 
			get :index
			expected_places = Place.all
			expect(assigns(:places)).to match_array(expected_places)
		end
	end
	describe "GET #create" do 
		it "fills with incorrect data: name, city and type must be present" do
			place = build(:place, name: "")
			expect(place.valid?).to eq(false)  
			place = build(:place,city: "")
			expect(place.valid?).to eq(false)  
			place = build(:place, type_of_site: "")
			expect(place.valid?).to eq(false)  
		end
		it "fills with incorrect data: name can not be in db" do
			other_place = create(:place)
			place = build(:place, name: other_place.name)
			expect(place.valid?).to eq(false) 
		end
		#REFACTOR ME PLISS!!!!!!
		it "fills with incorrect data: rate, time and price can be blank or nul" do
			place = build(:place, price: nil)
			expect(place.valid?).to eq(true)
			place.price = ""
			expect(place.valid?).to eq(true)
			place.price = -4.5
			expect(place.valid?).to eq(false) 
			place.price = "it's free"
			expect(place.valid?).to eq(false)

			place = build(:place, rate: nil)
			expect(place.valid?).to eq(true)
			place.rate = ""
			expect(place.valid?).to eq(true)
			place.rate = -4.5
			expect(place.valid?).to eq(false) 
			place.rate = "it's free"
			expect(place.valid?).to eq(false) 

			place = build(:place, time: nil)
			expect(place.valid?).to eq(true)
			place.time = ""
			expect(place.valid?).to eq(true)
			place.time = -4.5
			expect(place.valid?).to eq(false) 
			place.time = "it's free"
			expect(place.valid?).to eq(false)   
		end
		it "fills with incorrect data: address or lat/lon must be present" do 
			place = build(:place, address: "")
			expect(place.valid?).to eq(true)
			place = build(:place, lat: "", lon: "")
			expect(place.valid?).to eq(true)
		end
	end

	describe "GET #show" do 

		let(:expected_place) { create(:place) }
		it "render the show template" do 
			get :show, id: expected_place
			expect(response).to render_template("show")
		end
		it "responds with requested place" do 
			get :show, id: expected_place
			expect(assigns(:place)).to match expected_place
		end
	end
	describe "GET #edit" do 

		let(:edited_place) { create(:place) }
		#verificate loged and unloged users
		#verificate loged and unloged users
		#verificate loged and unloged users

		it "render the edit template" do 
			get :edit, id: edited_place
			expect(response).to render_template("edit")
		end
		it "associate the form with the requested place" do 
			get :edit, id: edited_place
			expect(assigns(:place)).to match edited_place
		end
		#add more to test the sending of the form with parameters
	end
	describe "PUT #update" do 

		let(:place_to_update) { create(:place) }

		it "updating a place with CORRECT INFO" do 
			put :update, id: place_to_update.id, 
			place: { name: "New name", price: 0 }

			place_to_update.reload

			expect(place_to_update.name).to eq("New name")
			expect(place_to_update.price).to eq(0)
		end
		it "updating a place with correct info redirects to site#index" do 
			put :update, id: place_to_update.id, 
			place: { name: "New name"}
			place_to_update.reload

			expect(response).to redirect_to('site#index')
		end
		it "updating a place with INCORRECT INFO and FIELDS" do 
			put :update, id: place_to_update.id, 
			place: { price: "FREE!!", rate: 0 }

			place_to_update.reload

			expect(place_to_update.rate).to eq(place_to_update.rate)
			expect(place_to_update.price).to eq(place_to_update.price)
		end
		it "updating a place with incorrect data redirects to place#edit" do 
			put :update, id: place_to_update.id, 
			place: { price: "FREE!!" }
			place_to_update.reload

			expect(response).to render_template("edit")
		end
	end
end
