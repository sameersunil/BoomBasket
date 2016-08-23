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
  end
end
