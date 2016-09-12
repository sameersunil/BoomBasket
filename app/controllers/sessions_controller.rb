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
    if session["I" + params[:prod]].nil?
      session[:count] = (session[:count].to_i + 1).to_s
      session["I" + params[:prod]] = params[:prod]  + ":" + (verifyQty params[:cart][:qty])
    else
      prevQty = session["I" + params[:prod]].split(":")[1]
      session["I" + params[:prod]] = params[:prod]  + ":" + ((verifyQty params[:cart][:qty]).to_i + prevQty.to_i).to_s
    end
    respond_to do |format|
      format.js
    end
  end

  def removeFromCart
    @user = current_user
    session[:count] = (session[:count].to_i - 1).to_s
    session["I" + params[:prod]] = nil
    redirect_to cart_path
  end
end
