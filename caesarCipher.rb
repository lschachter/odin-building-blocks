def caesar_cipher(message, key)
	key = key % 26
	codedMessage = ""
	message.each_char do |ch|
		ascii_num = ch.ord
		if (64 < ascii_num and ascii_num < 91) or (96 < ascii_num and ascii_num < 123)
			ascii_num <= 90 ? max_ord = 90 : max_ord = 122
			ascii_num = ascii_num + key
			if ascii_num > max_ord
				ascii_num = ascii_num - 26
			end	
		end
		codedMessage += ascii_num.chr
	end
	puts codedMessage
end

caesar_cipher("Hi What's up my name is BOBBYZ BABY0923U434IJ53;4LJN34U2", 27)