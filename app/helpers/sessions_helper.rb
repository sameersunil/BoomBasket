module SessionsHelper
	def sign_in user
		session[:remember_token] = user.email
		current_user= user
	end

	def sign_out
		session[:remember_token] = nil
		current_user= nil
	end

	def checkQty qty
		if not /^[1-9][0-9]*/.match(qty).nil?
			return qty
		else
			return "1"
		end
	end
end
