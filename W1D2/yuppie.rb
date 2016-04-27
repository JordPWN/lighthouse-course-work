def rent?(furnished, baller, rent)
	baller && (furnished || rent <= 2100) ? true : false
end

puts rent?(false, true, 2100) #true
puts rent?(true, true, 1800) #true
puts rent?(true, false,2100) #false
puts rent?(false, true, 2200) #false