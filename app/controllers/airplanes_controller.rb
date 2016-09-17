class AirplanesController < ApplicationController
	include ProductsHelper
	def new 
		@title = "New Airplane"
	end

	def create
		@airplane = Airplane.new desc: params[:airplane][:desc], name: params[:airplane][:name], price: params[:airplane][:price], img_url: params[:airplane][:img_url]
		@airplane.save
		redirect_to new_airplane_path 
	end

	def paginate
		@pageNum = params[:page].to_i
		@perPage = 12
		@pageCount = getPageNum @perPage
		@products = Product.where(cat: @category).limit(@perPage).offset((@pageNum - 1) * @perPage)
		@nextPage = getNextPageNum @pageNum, @pageCount
		@prevPage = getPrevPageNum @pageNum
		respond_to do |format|
			format.js
		end
	end

	def index
		@title = "Model Airplanes"
		@user = current_user
		@pageNum = params[:page].to_i
		@perPage = 12
		@pageCount = getPageNum @perPage
		@airplanes = Airplane.limit(@perPage).order(:name).offset((@pageNum - 1) * @perPage)
		@nextPage = getNextPageNum @pageNum, @pageCount
		@prevPage = getPrevPageNum @pageNum
	end

end
