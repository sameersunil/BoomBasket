class UsersController < ApplicationController
	include SessionsHelper

	def show
	end

	def create
		email = params[:user][:email]
		fName = params[:user][:fname]
		lName = params[:user][:lname]
		pwd = params[:user][:pwd]
		pwdR = params[:user][:pwdr]
		country = params[:user][:country]

		@statusCode = []

		if not User.find_by_email(email).nil?
			@statusCode.push("User exists")
		end
		
		if @statusCode.size == 0
			@user = User.new email: email, fname: fName, lname: lName, pwd: pwd, country: country
			if @user.save
				sign_in @user
				redirect_to root_path(info: "Signup Complete!")
			end
		end
		
		respond_to do |format|
			format.js
		end
	end
end