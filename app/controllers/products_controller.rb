class ProductsController < ApplicationController
	def index
		@title = params[:category]
		@category= @title
		@user = current_user
		@products = Product.where(cat: @category)
	end
	
	def new
		@title = "New Product"
	end

	def create
		@prod = Product.new cat: params[:product][:cat], name: params[:product][:name], price: params[:product][:price], img_url: params[:product][:img_url]
		@prod.save
		redirect_to products_new_path 
	end

	def search
		@user = current_user
		@searchResults = Product.find_by_name(params[:search])
	end
end
