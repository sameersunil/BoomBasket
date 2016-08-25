class OrdersController < ApplicationController
	include ApplicationHelper
	def show
		@user = current_user
	end

	def index
		@user = current_user
	end

	def create
		@user = current_user
		summary = ""
		total = 0
		request.session.to_hash.each{|key, value| 
        	product = Product.find_by_id(value.to_s)
        	if not product.nil?
        		summary += product.id.to_s + ":"
        		total += product.price
        		session[key] = nil
            end
         }
        session[:count] = "0"
        order = Order.new email: @user.email, summary: summary, total: total
        if order.save
        	redirect_to order_path(order.id)
        end
	end
end
