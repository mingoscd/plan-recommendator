require 'rails_helper'

RSpec.describe SiteController, type: :controller do
	describe "GET #index" do 
		it "responds successfully with HTTP 200 code" do 
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		#modify this test, render index when session ok, else render no_user_index
		it "render the index template" do 
			get :index
			expect(response).to render_template("index")
		end
	end
end
