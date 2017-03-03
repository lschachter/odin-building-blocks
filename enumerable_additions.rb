module Enumerable
	def my_each
		return self.to_enum if !block_given?
		len = self.length
		len.times do |i|
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		return self.to_enum if !block_given?
		len = self.length
		len.times do |i|
			yield(self[i],i)
		end
		self
	end

	def my_select
		return self.to_enum if !block_given?
		selected = []
		self.my_each do |el|
			if yield(el) == true
				selected << el
			end
		end
		selected
	end

	def my_all?
		all_flag = true
		return all_flag if !block_given?
		self.my_each do |el|
			if yield(el) == false
				all_flag = false
				break
			end
		end
		all_flag
	end

	def my_any?
		any_flag = false
		if !block_given?
			return self.length < 1 ? any_flag : !any_flag
		end
		self.my_each do |el|
			if yield(el) == true
				any_flag = true
				break
			end
		end
		any_flag
	end 

	def my_none?
		none_flag = true
		if !block_given?
			return self.length < 1 ? none_flag : !none_flag
		end
		self.my_each do |el|
			if yield(el) == true
				none_flag = false
				break
			end
		end
		none_flag
	end

	def my_count(*wild)
		if block_given?
			self.my_select do |el|
				yield(el)
			end.length
		elsif wild.length > 0
			self.my_select do |el|
				el == wild[0]
			end.length
		else
			self.length
		end
	end

	def my_map
		return self.to_enum if !block_given?
		newArr = []
		self.my_each do |el|
			newArr << yield(el)
		end
		newArr
	end

	def my_inject(*memos) 
		start = memos.empty? ? 1 : 0
		memos.length > (start+1)%2 ? memo = memos[0] : memo = self[0]
		self[start..-1].my_each do |el|
			block_given? ? memo = yield(memo, el) : memo = memo.send(memos[memos.length-1],el)
		end
		memo
	end

end

# arr = [0,2,9,4,2,6]

# arr.my_each {|el| puts el*2}
# arr.each {|el| puts el*2}

# arr.my_each_with_index {|el,i| puts "#{i}. #{el}"}
# arr.each_with_index {|el,i| puts "#{i}. #{el}"}

# puts arr.my_select {|el| el.even?}
# puts arr.select {|el| el.even?}

# puts arr.my_all? {|el| el.even?}
# puts arr.all? {|el| el.even?}
# puts arr.my_all? {|el| el.is_a? Integer}
# puts arr.all? {|el| el.is_a? Integer}

# puts arr.my_any? {|el| el.even?}
# puts arr.any? {|el| el.even?}
# puts arr.my_any? {|el| el.is_a? String}
# puts arr.any? {|el| el.is_a? String}

# puts arr.my_none? {|el| el.even?}
# puts arr.none? {|el| el.even?}
# puts arr.my_none? {|el| el.is_a? String}
# puts arr.none? {|el| el.is_a? String}

# puts arr.my_count { |el| el.even?}
# puts arr.count { |el| el.even?}
# puts arr.my_count
# puts arr.count
# puts arr.my_count(2)
# puts arr.count(2)

# puts arr.my_map{ |i| i*i}
# puts arr.map{ |i| i*i}
# puts arr.my_map{"cat"}
# puts arr.map{"cat"}

# double = Proc.new { |x| x * 2 }
# puts arr.my_map(&double)
# puts arr.map(&double)
# puts arr.my_map(&double) { |i| i*3}
# puts arr.map(&double) { |i| i*3}

# puts arr.my_inject{ |sum, n| sum + n }
# puts arr.inject{ |sum, n| sum + n }
# puts arr.my_inject(10){ |product, n| product * n }
# puts arr.inject(10){ |product, n| product * n }
# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# puts longest
# longest = %w{ cat sheep bear }.inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# puts longest

# puts arr.my_inject(:+)
# puts arr.inject(:+)
# puts arr.my_inject(10, :+)
# puts arr.inject(10, :+)

# def multiply_els(array)
# 	array.my_inject(:*)
# end

# puts multiply_els([2,4,5])

# puts [].my_all? #true
# puts [].my_any? #false
# puts [].my_none? #true
# puts arr.my_all? #true
# puts arr.my_any? #true
# puts arr.my_none? #false
# puts arr.my_select
# puts arr.my_each
# puts arr.my_each_with_index
# puts arr.my_map
