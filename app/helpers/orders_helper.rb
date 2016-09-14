module OrdersHelper
	def getProductsList orderSummary
		productsList = Array.new
		quantityList = Array.new
		productInfos = orderSummary.split(";")
		productInfos.each do |productInfo|
			productInfo = productInfo.split(":")
			type = productInfo[0]
			id = productInfo[1]
			qty = productInfo[2]
			if type == 'G'
				productsList.push(Product.find(id))
			elsif type == 'MA'
				productsList.push(Airplane.find(id))
			elsif type == "MAP"
				productsList.push(Part.find(id))
			end
			quantityList.push(qty)
		end
		return productsList, quantityList
	end
end
