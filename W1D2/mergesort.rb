def sort(arr)

	array = []#init array

	if arr.size <= 1 #If the array is 1 or less, you're sorted! Exit.
		return arr
	end

	front = sort arr.slice(0, arr.size/2.floor) #Grab first half, and slice it. Reiterates through, and chops it until it's no longer choppable
	back = sort arr.slice(arr.size/2.ceil, arr.size) #Same for the second half

	offset_front, offset_back = 0, 0 #initialize offsets

	while offset_front < front.size && offset_back < back.size #Iterate through the array
		temp_front = front[offset_front] # temp is front at element of offset
		temp_back = back[offset_back] #same for back

		if temp_front <= temp_back #if Temp is >=, push it into the array, otherwise, put the back into
			array << temp_front
			offset_front += 1
		else
			array << temp_back
			offset_back += 1
		end
	end
	while offset_front < front.size #push front@element offset 
		array << front[offset_front]
		offset_front += 1
	end

	while offset_back < back.size #same for back
		array << back[offset_back]
		offset_back += 1
	end

	return array

end

my_array = [5,45,32,2,1]
puts sort(my_array)