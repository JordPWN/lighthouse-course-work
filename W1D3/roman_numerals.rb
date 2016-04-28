@roman = {
  	'M'=> 1000,
  	'CM'=> 900,
  	'D'=> 500,
  	'CD'=> 400,
  	'C'=> 100,
  	'XC'=> 90,
  	'L'=> 50,
  	'XL'=> 40,
  	'X'=> 10,
  	'IX'=> 9,
  	'V'=> 5,
  	'IV'=> 4,
  	'I'=> 1
}
def to_roman(num)
  # Your code here
  your_num = ""
  while num != 0
  	@roman.each do |numeral, number|
  		while num >= number
  			your_num += numeral
  			num -= number
  		end
  	end
  end
  return your_num
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) #== "I"
puts to_roman(3) #== "III"
puts to_roman(6) #== "VI"
puts to_roman(4)
puts to_roman(1453)
puts to_roman(1646)
puts to_roman(44)
puts to_roman(944)
# TODO=> what other cases could you add to ensure your to_roman method is working?