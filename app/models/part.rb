class Part < ApplicationRecord
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

	belongs_to :airplane
	
	validates :name, presence: true
	validates :price, presence: true
	validates :img_url, presence: true
end

Part.import	
