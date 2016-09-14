class PartsController < ApplicationController
	def new 
		@title = "New Part"
	end

	def create
		@part = Part.new airplane_id: params[:part][:airplane_id], name: params[:part][:name], price: params[:part][:price], img_url: params[:part][:img_url]
		@part.save
		redirect_to new_part_path 
	end
end
