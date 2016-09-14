module SessionsHelper
	def sign_in user
		session[:remember_token] = user.email
		current_user= user
	end

	def sign_out
		session[:remember_token] = nil
		current_user= nil
	end
end
