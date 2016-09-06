class ProductsController < ApplicationController
	def index
		@title = params[:category]
		@category= @title
		@user = current_user 
		@products = Product.where(cat: @category)
		@totalProd = @products.length
		if @totalProd % 10 != 0
			@pageCount = @totalProd / 10 + 1
		else
			@pageCount = @totalProd / 10
		end
		session[:pageCount] = session[:pageCount].nil? ?  "1" : (session[:pageCount].to_i + 1).to_s
		@currentPageNum = session[:pageCount].to_i
		@start = @currentPageNum * 9
		@end = @start + 9
		respond_to do |format|
			format.js
			format.html
		end
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
