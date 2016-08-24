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
    request.session.to_hash.each{|key, value| 
        product = Product.find_by_id(key.to_s)
        if not product.nil?
          @products.push(product)
        end
    }
  end
end
