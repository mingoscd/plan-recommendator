class UsersController < ApplicationController
	before_action :load_user, except: :index
	before_filter :authorize
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
		@user = User.find params[:id]
	end

	def user_params
		params.require(:user).permit(:name, :surname, :password, :password_confirmation, :birthday, :genre, :avatar)
	end
end
