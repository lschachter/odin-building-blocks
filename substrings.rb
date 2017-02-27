def substrings(data, dictionary)
	words = data.downcase.split(' ')

	frequencies = Hash[dictionary.map {|word| [word,0]}]
	dictionary.each do |oked_word|
		ok_length = oked_word.length
		words.each do |word|
			if ok_length <= word.length
				frequencies[oked_word] += word.scan(/#{oked_word.downcase}/).count
			end
		end
	end

	frequencies
end

dictionary = ["Below","down","Go","going","horn","how","howdy","IT","i","low","own","part","partner","Sit"]
puts substrings("Howdy partner, isit down! How's it going?", dictionary)