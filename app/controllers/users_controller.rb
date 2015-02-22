class UsersController < ApplicationController
	#CRUD methods

	def index
		#@users = User.all
	end

	def show
		@user = User.find params[:id]
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
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

	def user_params
		params.require(:user).permit(:name, :surname, :password, :password_confirmation, :birthday, :genre, :avatar)
	end
end
