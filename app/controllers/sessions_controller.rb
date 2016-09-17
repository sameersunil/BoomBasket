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
    prefix = params[:type].nil? ? "G" : params[:type]
    if session[prefix + params[:prod]].nil?
        session[:count] = (session[:count].to_i + 1).to_s
        session[prefix + params[:prod]] = params[:prod]  + ":" + params[:cart][:qty]
    else
        prevQty = session[prefix + params[:prod]].split(":")[1]
        session[prefix + params[:prod]] = params[:prod]  + ":" + (params[:cart][:qty].to_i + prevQty.to_i).to_s
    end
    case params[:type]
    when "G" 
        @product = Product.find(params[:prod])
    when "MA"
        @product = Airplane.find(params[:prod])
    when "MAP"
        @product = Part.find(params[:prod])
    end
    respond_to do |format|
      format.js
    end
  end

  def removeFromCart
    @user = current_user
    prefix = params[:type].nil? ? "G" : params[:type]

    if not session[prefix + params[:prod]].nil?
        session[:count] = (session[:count].to_i - 1).to_s
        session[prefix + params[:prod]] = nil
    end
    redirect_to cart_path
  end
end
