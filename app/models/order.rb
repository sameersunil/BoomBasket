class Order < ApplicationRecord
	EMAIL_REG_EXP=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :total, presence: true
	validates :summary, presence: true
	validates :email, presence: true, format: { with: EMAIL_REG_EXP }
end
