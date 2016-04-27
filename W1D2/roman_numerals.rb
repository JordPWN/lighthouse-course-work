
def to_roman(num)
  # Your code here
  your_num = ""
  while num != 0
	  if num >= 1000
	  	num -= 1000
	  	your_num += "M"
	  	to_roman(num)
	  end
	  if num >=500
	  	num -= 500
	  	your_num += "D"
	  	to_roman(num)
	  end
	  if num >=100
	  	num -= 100
	  	your_num += "C"
	  	to_roman(num)
	  end
	  if num >= 50
	  	num -= 50
	  	your_num += "L"
	  	to_roman(num)
	  end
	  if num >= 10
	  	num -= 10
	  	your_num += "X"
	  	to_roman(num)
	  if num >= 9
	  	num -= 9
	  	your_num += "IX"
	  	to_roman(num)
	  end
	  end
	  if num >= 5
	  	num -= 5
	  	your_num += "V"
	  	to_roman(num)
	  end
	  if num >= 4
	  	num -= 4
	  	your_num += "IV"
	  	to_roman(num)
	  end
	  if num >= 1
	  	num -= 1
	  	your_num += "I"
	  	to_roman(num)
	  end
  end
  return your_num
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) #== "I"
puts to_roman(3) #== "III"
puts to_roman(6) #== "VI"
puts to_roman(4)
 
# TODO: what other cases could you add to ensure your to_roman method is working?