class ProductsController < ApplicationController
	include ProductsHelper
	def index
		@user = current_user
		@title = params[:category]
		@category = @title 
		@pageNum = params[:page].to_i
		@perPage = 15
		@pageCount = getPageNum @perPage
		@products = Product.where(cat: @category).limit(@perPage).offset((@pageNum - 1) * @perPage)
		@nextPage = getNextPageNum @pageNum, @pageCount
		@prevPage = getPrevPageNum @pageNum
	end

	def paginate
		@category = params[:category]
		@pageNum = params[:page].to_i
		@perPage = 15
		@pageCount = getPageNum @perPage
		@products = Product.where(cat: @category).limit(@perPage).offset((@pageNum - 1) * @perPage)
		@nextPage = getNextPageNum @pageNum, @pageCount
		@prevPage = getPrevPageNum @pageNum
		respond_to do |format|
			format.js
		end
	end
	
	def new
		@title = "New Product"
	end

	def create
		@prod = Product.new cat: params[:product][:cat], name: params[:product][:name], price: params[:product][:price], img_url: params[:product][:img_url]
		@prod.save
		redirect_to new_product_path 
	end
end
