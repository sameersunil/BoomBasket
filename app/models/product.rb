class Product < ApplicationRecord
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks
	validates :name, :presence => true
	validates :cat, :presence => true
	validates :price, :presence => true
	validates :img_url, :presence => true
end

Product.import	