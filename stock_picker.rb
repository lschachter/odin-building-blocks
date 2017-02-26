def stock_picker(stocks)
	min_day = 0
	buy_day = 0
	max_diff_day = 1
	max_diff = stocks[1]-stocks[0]
	
	(2...(stocks.count)).each do |day|
		if stocks[day] - stocks[min_day] > max_diff
			max_diff_day = day
			max_diff = stocks[day] - stocks[min_day]
			buy_day = min_day
		elsif stocks[day] < stocks[min_day]
			min_day = day
		end
	end
	puts "Max difference: #{max_diff}"
	puts "Days of buy and sell: [#{buy_day},#{max_diff_day}]"
end

stock_picker([17,3,6,9,15,8,6,1,18,0])