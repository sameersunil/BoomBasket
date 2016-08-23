class Product < ApplicationRecord
	validates :name, :presence => true
	validates :cat, :presence => true
	validates :price, :presence => true
	validates :img_url, :presence => true
end
