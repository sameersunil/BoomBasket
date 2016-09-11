module ProductsHelper
	def getPageNum perPage
		pageCount = Product.where(cat: @category).count
		if pageCount == 0
			pageCount = 1
		elsif pageCount % perPage != 0
			pageCount = pageCount / perPage + 1
		else
			pageCount = pageCount / perPage
		end
		return pageCount
	end

	def getNextPageNum currPageNum, pageCount
		if currPageNum == pageCount
			return ""
		else
			return (currPageNum + 1).to_s
		end
	end

	def getPrevPageNum currPageNum
		if currPageNum == 1
			return ""
		else
			return (currPageNum - 1).to_s
		end
	end
end
