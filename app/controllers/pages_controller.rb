class PagesController < ApplicationController
  include ApplicationHelper

  def home
  	@title = "Home"
  	@user = current_user
  end

  def sign_in
  	@title = "Sign In"
  end

  def cart
  	@title = "Cart"
  	@user = current_user
    @products = Array.new
    @qtys = Array.new
    @count = 0
    @total = 0
    @go = :cart
    request.session.to_hash.each{|key, value| 
        if not /I/.match(key).nil?
          tmp = value.split(":")
          productID = tmp[0]
          qty = tmp[1]
          product = Product.find_by_id(productID)
          if (not product.nil?)
            @count += 1
            @total += (product.price.to_i * qty.to_i)
            @products.push(product)
            @qtys.push(qty)
          end
        end
    }
    @len = @products.length
  end
end
