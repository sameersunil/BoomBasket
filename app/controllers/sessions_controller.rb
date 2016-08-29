  class SessionsController < ApplicationController
	include SessionsHelper

	def new
		@title = "Sign In"
    @failed = params[:login_again]
    if not params[:go].nil?
      @go = "cart"
    end
	end
	
	def create
  		@user = User.authenticate params[:session][:email], params[:session][:pwd]
  		if not @user.nil? 
	  		sign_in @user
      end
      respond_to do |format|
        format.js
      end
	end

	def destroy
		@title = "Home"
		sign_out
		redirect_to root_path
	end

  def addToCart
    session[:count] = (session[:count].to_i + 1).to_s
    session["I" + params[:prod]] = params[:prod]
  end

  def removeFromCart
    @user = current_user
    session[:count] = (session[:count].to_i - 1).to_s
    session["I" + params[:prod]] = nil
    redirect_to cart_path
  end
end
