# Sort the array from lowest to highest
def sort(list)
	return list if list.size <= 1 #If the array is <= 1
  	swapped = false #init the swapped flag to false
  	while !swapped #Swap until the array is sort
    	swapped = false #reset the swapped flag to false
    	0.upto(list.size-2) do |i| #for each item of the array-2 check to see if the current element is larger than the next, if so, swap
      		if list[i] > list[i+1]
        		list[i], list[i+1] = list[i+1], list[i]
        		swapped = true #when swapped is true, move on to next element
      		end
    	end
  	end
  	return list
end

# Find the maximum 
def maximum(arr)
  sort(arr).last
end

def minimum(arr)
  sort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"