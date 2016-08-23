class ProductsController < ApplicationController
	def index
		@title = "Products"
	end

	def household
		@title = "House Hold"
	end

	def personalCare
		@title = "Personal Care"
		@products = Product.where cat: "Personal Care"
	end

	def videoGames
		@title = "Video Games"
		@products = Product.where cat: "Video Games"
	end
	
	def new
		@title = "New Product"
		@prod = Product.new
	end

	def create
		@prod = Product.new cat: params[:product][:cat], name: params[:product][:name], price: params[:product][:price], img_url: params[:product][:img_url]
		@prod.save
		redirect_to products_new_path 
	end
end
