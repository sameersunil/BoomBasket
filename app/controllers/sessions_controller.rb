class SessionsController < ApplicationController
	include SessionsHelper

	def new
		@title = "Sign In"
    @failed = params[:login_again]
	end
	
	def create
  		@user = User.authenticate params[:session][:email], params[:session][:pwd]
  		if @user.nil?
  			redirect_to sign_in_path(login_again: true) 
  		else
	  		sign_in @user
	  		redirect_to root_url
	  	end

  	end

  	def destroy
  		@title = "Home"
  		sign_out
  		redirect_to root_url
  	end
end
