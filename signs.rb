def price(l,w,c)
	c <= 2 ? (10*c + ((l*w)/15)) * 1.15 : (15*c + ((l*w)/15)) * 1.15
end
user_input = []
puts "length?"
user_input[0] = gets.chomp.to_i
puts "width?"
user_input[1] = gets.chomp.to_i
puts "colours?"
user_input[2] = gets.chomp.to_i
puts price(user_input[0],user_input[1],user_input[2])