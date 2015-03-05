class RegisterController < ApplicationController
	skip_before_filter :authenticate_user!
	def new
		@user = User.new
		render 'new', layout: 'no_menu'
	end

	def create
		@user = User.new user_params
		if @user.save
			#send email
			sign_in @user
			redirect_to root_path
			#flash[:notice] = "User created correctly, now check your email to verify your account"
			#render 'check_email', layout: 'no_menu'
		else
			render 'new', layout: 'no_menu'
		end
	end

	def check_email
	end

	private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end