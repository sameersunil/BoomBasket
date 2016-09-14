class Airplane < ApplicationRecord
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

	has_many :parts
	
	validates :name, presence: true
	validates :price, presence: true
	validates :desc, presence: true
	validates :img_url, presence: true
end

Airplane.import