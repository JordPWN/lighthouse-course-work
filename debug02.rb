def average(numbers)
  sum = 0
  array_size = numbers.size
  if numbers == []
  	return nil
  end
  numbers.each do |num|
  	if num == nil
  		array_size = array_size - 1
  		next
  	end
  	if num != "/\d/"
  		num = num.to_i
  	end
    if num != nil
    	sum += num
    end
  end
  sum / array_size.to_f
end

## TEST HELPER METHOD
def test_average(array=nil)
  print "avg of #{array.inspect}:"
  if array == nil
  	return p nil.inspect
  else
  	result = average(array)
  	p result
  end
end

## TEST CODE
test_average([4,5,6]) # => 5
test_average([15,5,10]) # => 10

# Should treat string like number //convert string to int in method
test_average([15,'5',10]) # => 10

# Should show decimal value
test_average([10, 5]) # => 7.5 instead of just 7 == Try float or ceil.

# Watch out! Even tests can have bugs!
test_average([9, 5, 7]) #Added brackets

# Empty set should return nil, not throw an error
test_average([]) # => nil

# Non-existent set should return nil
test_average() # => nil

# BONUS: Should ignore nils in the set
test_average([9,6,nil,3]) # => 6
