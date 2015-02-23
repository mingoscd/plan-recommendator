class SiteController < ApplicationController
	def index
		if session[:user_id].nil?
			render 'index', layout: 'no_menu'
		else
			redirect_to user_path(session[:user_id])
		end
	end
end
