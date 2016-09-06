class OrdersController < ApplicationController
	include ApplicationHelper
	def show
		@user = current_user
	end

	def index
		@user = current_user
		@orders = Order.where email: @user.email
	end

	def create
		@user = current_user
		summary = ""
		total = 0
		request.session.to_hash.each{|key, value|
			if not /I/.match(key).nil?
          		tmp = value.split(":")
          		productID = tmp[0]
          		qty = tmp[1] 
        		product = Product.find_by_id(productID)
	        	if not product.nil?
	        		summary += value + ";"
	        		total += (product.price * qty.to_i)
	        		session[key] = nil
	        	end
            end
         }
        session[:count] = "0"
        order = Order.new email: @user.email, summary: summary, total: total
        if order.save
        	redirect_to order_path(order.id)
        end
	end
end
