class UsersController < ApplicationController
	before_action :load_user
	#CRUD methods
	def index
		#@users = User.all
	end

	def show
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		if @user.update_attributes user_params
			flash[:notice] = "User updated correctly"
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

	#private methods
	private

	def load_user
		@user = User.find params[:id]
		rescue ActiveRecord::RecordNotFound
		render 'not_found', layout: 'no_menu'
	end

	def user_params
		params.require(:user).permit(:name, :surname, :password, :password_confirmation, :birthday, :genre, :avatar, :marker)
	end
end
