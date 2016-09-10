module ProductsHelper
	def getPageNum
		pageCount = Product.where(cat: @category).count
		if pageCount % 10 != 0
			pageCount = pageCount / 10 + 1
		else
			pageCount = pageCount / 10
		end
		return pageCount
	end

	def getNextPageNum currPageNum, pageCount
		if currPageNum == pageCount + 1
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
