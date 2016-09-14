class User < ApplicationRecord
	EMAIL_REG_EXP=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	#ADD the password encryption
	validates :pwd, presence: true, length: { within: 6..40 }
	validates :email, presence: true, format: { with: EMAIL_REG_EXP }, uniqueness: { case_sensitive: false }
	validates :fname, presence: true
	validates :country, presence: true
	
	def self.authenticate user_email, user_pwd
		user = User.find_by_email user_email
		unless user.nil?
			if user.pwd == user_pwd
				return user
			end
		end
	end
end
