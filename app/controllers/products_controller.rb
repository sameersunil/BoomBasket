class ProductsController < ApplicationController
	def household
		@title = "Household"
		@user = current_user
		@products = Product.where cat: "Household"
	end

	def personalCare
		@title = "Personal Care"
		@user = current_user
		@products = Product.where cat: "Personal Care"
	end

	def videoGames
		@title = "Video Games"
		@user = current_user
		@products = Product.where cat: "Video Games"
	end

	def beverages
		@title = "Beverages"
		@user = current_user
		@products = Product.where cat: "Beverages"
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
