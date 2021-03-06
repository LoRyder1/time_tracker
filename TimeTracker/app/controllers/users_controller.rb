class UsersController < ApplicationController
	def new
		@user = User.new	
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to tasks_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username,:display_name,:email,:password,:password_confirmation)
	end

	def redirect_if_logged_in
		redirect_to root_path if logged_in?
	end
end
