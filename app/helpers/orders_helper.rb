module OrdersHelper
	def getProductsList orderSummary
		productsList = Array.new
		quantityList = Array.new
		productInfos = orderSummary.split(";")
		productInfos.each do |productInfo|
			id = productInfo.split(":")[0]
			qty = productInfo.split(":")[1]
			productsList.push(Product.find(id))	
			quantityList.push(qty)
		end
		return productsList, quantityList
	end
end
