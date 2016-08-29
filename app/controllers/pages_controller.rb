class PagesController < ApplicationController
  include ApplicationHelper

  def home
  	@title = "Home"
  end

  def sign_in
  	@title = "Sign In"
  end

  def cart
  	@title = "Cart"
  	@user = current_user
    @products = Array.new
    @count = 0
    @total = 0
    @go = :cart
    request.session.to_hash.each{|key, value| 
        if not /I/.match(key).nil?
          product = Product.find_by_id(value.to_s)
          if (not product.nil?)
            @count += 1
            @total += product.price
            @products.push(product)
          end
        end
    }
  end
end
