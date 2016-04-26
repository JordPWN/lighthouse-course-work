# Save this file to your computer so you can run it 
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your dog (named Shakil).
 
# You'll probably want to write other methods, but this 
# encapsulates the core dog logic
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
# Run our method
until shakil_the_dog == false
end