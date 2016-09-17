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
		if email == ""
			@statusCode.push("E")
		end
		if fName == ""
			@statusCode.push("F")
		end
		if lName == ""
			@statusCode.push("L")
		end
		if country == ""
			@statusCode.push("C")
		end
		if pwd == ""
			@statusCode.push("P")
		end
		if pwdR == ""
			@statusCode.push("R")
		end
		if pwd != pwdR
			@statusCode.push("M")
		end
		if @statusCode.size == 0
			@user = User.create email: email, fname: fName, lname: lName, pwd: pwd, country: country
			sign_in @user
		end
		respond_to do |format|
			format.js
		end
	end
end