class LoginController < ApplicationController
  def login_check
  	# puts params[:session][:email].class
  	@user = User.find_by(first_name: params[:session][:first_name], last_name: params[:session][:last_name], email: params[:session][:email])
  	flash[:notice] = "You have to register to access to the homepage."
		redirect = "/register"
		unless @user.nil?
			log_in @user
			flash[:notice] = "It worked! You now are connected !"
			redirect = '/'
		end
		redirect_to redirect
  end

  def logout
  	log_out
  	flash[:notice] = "You have been successfully disconnected !"
  	redirect_to '/'
  end
end
