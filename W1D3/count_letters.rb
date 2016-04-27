def count_letters(to_count)
	my_hash = Hash.new(0)
	to_count.chomp.split('').each do |letter|
		my_hash[letter] += 1
	end
	my_hash	
end
# puts count_letters("lighthouse in the house...")

def count_index(to_count)
	my_hash = Hash.new{|hash, key| hash[key] = []}
	count = 0
	to_count.split('').each do |letter|
		count += 1
		my_hash[letter].push(count)
	end
	my_hash	
end
puts count_index("lighthouse in the house...")