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

	def index
		@user = current_user
		@category = @title 
		@pageNum = params[:page].to_i
		@perPage = 15
		@pageCount = getPageNum @perPage
		@airplanes = Airplane.limit(@perPage).offset((@pageNum - 1) * @perPage)
		@nextPage = getNextPageNum @pageNum, @pageCount
		@prevPage = getPrevPageNum @pageNum
	end

end
