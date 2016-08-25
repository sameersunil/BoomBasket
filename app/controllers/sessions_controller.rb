class SessionsController < ApplicationController
	include SessionsHelper

	def new
		@title = "Sign In"
    @failed = params[:login_again]
    if params[:go] == "1"
      @prevPage = "1"
    end
	end
	
	def create
  		@user = User.authenticate params[:session][:email], params[:session][:pwd]
  		if @user.nil?
  			redirect_to sign_in_path(login_again: true) 
  		else
	  		sign_in @user
        if params[:go].nil?
            redirect_to root_url
        else
            redirect_to cart_path
        end
	  	end

  	end

  	def destroy
  		@title = "Home"
  		sign_out
  		redirect_to root_url
  	end

    def addToCart
      session[:count] = (session[:count].to_i + 1).to_s
      session[session[:count]] = params[:prod]
      cat = params[:cat]
      redirect_to case cat
      when "Household" 
        products_household_path
      when "Personal Care" 
        products_personal_care_path
      when "Beverages" 
        products_beverages_path
      when "Video Games" 
        products_video_games_path
      end
    end

    def removeFromCart
      @user = current_user
      session[:count] = (session[:count].to_i - 1).to_s
      session[params[:prod]] = nil
      redirect_to cart_path
    end
end
