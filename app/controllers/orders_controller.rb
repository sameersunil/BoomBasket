class OrdersController < ApplicationController
	include ApplicationHelper, OrdersHelper
	def show
		@title = "Order"
		@user = current_user
		order = Order.find(params[:id])
		@orderID = order.id
		productsInfo = getProductsList order.summary
		@productsList = productsInfo[0]
		@quantityList = productsInfo[1]
	end

	def index
		@title = "Orders"
		@user = current_user
		@orders = Order.where(email: @user.email).order(created_at: :desc)
	end

	def create
		@title = "Order"
		@user = current_user
		summary = ""
		total = 0
		request.session.to_hash.each{|key, value|
			if not /G|MA|MAP/.match(key).nil?
          		tmp = value.split(":")
          		productID = tmp[0]
          		qty = tmp[1] 
        		if not /G/.match(key).nil?
            		product = Product.find_by_id(productID)
            		summary +=  'G' + ':' + value + ";"
          		elsif not /MAP/.match(key).nil?
	            	product = Part.find_by_id(productID)
	            	summary +=  'MAP' + ':' + value + ";"
	          	elsif not /MA/.match(key).nil?
	            	product = Airplane.find_by_id(productID)
	            	summary +=  'MA' + ':' + value + ";"
	          	end
        		total += (product.price * qty.to_i)
        		session[key] = nil
            end
         }
        session[:count] = "0"
        order = Order.new email: @user.email, summary: summary, total: total
        order.save
        redirect_to root_path(info: "Continue Shopping!")
	end
end
