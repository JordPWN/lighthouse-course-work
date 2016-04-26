def fizzbuzz (first_num, last_num)
	first_num.upto(last_num) do |i|
	  	if i % 15 == 0
	    	puts "FizzBuzz"
	  	elsif i % 3 == 0
	    	puts "Fizz"
	    elsif i % 5 == 0
	    	puts "Buzz"
	  	else
	    	puts i
	  	end
	end
end

user_input = gets.chomp.to_i
FizzBuzz(user_input)