class Product < ApplicationRecord
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

	validates :name, :presence => true
	validates :cat, :presence => true
	validates :price, :presence => true
	validates :img_url, :presence => true

	def as_indexed_json(options={})
    as_json(
      only: [:name]
      )
  end
end

Product.import	