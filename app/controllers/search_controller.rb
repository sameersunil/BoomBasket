class SearchController < ApplicationController
  	def search
  		@title = "Search"
		if params[:q].nil?
			@searchResults = []
		else
			@searchResultsProducts = Product.search(params[:q]).records
			@searchResultsAirplanes = Airplane.search(params[:q]).records
			@searchResultsParts = Part.search(params[:q]).records
			@searchResults = @searchResultsAirplanes + @searchResultsParts + @searchResultsProducts
		end
 	end
end
