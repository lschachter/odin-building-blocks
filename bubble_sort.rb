def bubble_sort(arr)
	n = arr.length
	(n-1).times do |k|
		swaps = 0
		(n-k-1).times do |j|
			if arr[j] > arr[j+1]
				swaps += 1
				arr[j],arr[j+1] = arr[j+1],arr[j]
			end
		end
		if swaps == 0
			break
		end
	end
	arr
end

puts bubble_sort([8,7,6,5,4,3,2,1,9,10,11])
puts bubble_sort([4,3,78,2,0,2])