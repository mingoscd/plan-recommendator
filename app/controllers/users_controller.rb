class UsersController < ApplicationController
	#before_action :load_user, except: :index
	#CRUD methods
	def index
		#@users = User.all
	end

	def show
	end

	def edit
	end

	def update
		if @user.update_attributes user_params
			flash[:notice] = "User updated correctly"
			redirect_to 'site#index'
		else
			render 'edit'
		end
	end

	def destroy
	end

	#other
	def search
	end

	#private methods
	private

	def load_user
		render 'deny_access', layout: 'no_menu' if session[:user_id] != params[:id].to_i
		@user = User.find params[:id]
		rescue ActiveRecord::RecordNotFound
		render 'not_found', layout: 'no_menu'
	end

	def user_params
		params.require(:user).permit(:name, :surname, :password, :password_confirmation, :birthday, :genre, :avatar)
	end
end
