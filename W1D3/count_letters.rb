def count_letters(to_count)
	my_hash = Hash.new(0)
	to_count.chomp.split('').each do |letter|
		my_hash[letter] += 1
	end
	my_hash	
end
puts count_letters("lighthouse in the house...")