class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def sign_in
  	@title = "Sign In"
  end

  def cart
  	@title = "Cart"
  end
end
