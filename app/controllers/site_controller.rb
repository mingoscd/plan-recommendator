class SiteController < ApplicationController
	skip_before_filter :authenticate_user!
	def index
		if user_signed_in?
			redirect_to suggest_path
		else
			render 'index', layout: 'no_menu'
		end
	end
end
