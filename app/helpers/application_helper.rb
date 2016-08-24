module ApplicationHelper
	def title
		base_title = "BoomBox"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def getServerIP
		"192.168.43.160"
	end

	def current_user= user
		@current_user = user
	end

	def current_user
		User.find_by_email session[:remember_token]
	end
end
