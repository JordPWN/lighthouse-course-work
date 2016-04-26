def shakil_the_dog()
	puts "Talk to Shakil!"
	user_input = gets.chomp.downcase
		case(user_input)
		when (/shakil.*stop/)
		when "meow"
			puts woof(5).upcase
		when (/.*treat.*/)
		when "woof"
			puts woof(3)
		when "go away"
			puts "Shakil leaves the room."
			return false
		else
			puts woof(1)
		end
end

def woof(woofs)
	numwoofs = ""
	for i in 1..woofs
		numwoofs += "woof "
	end
	return numwoofs
end

until shakil_the_dog == false
end