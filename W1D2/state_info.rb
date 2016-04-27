@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
}

@states[WA:'Washington']
@states[TX:"Texas"]

@cities = {
	OR: ["Portland", "Beaverton", "Salem"],
	FL: ["Talahasse", "Fort Lauderdale", "Disneyland"],
	CA: ["Los Angeles", "San Diego", "San Francisco"],
	NY: ["New York City", "New Jersey", "Buffallo"],
	MI: ["Detroit", "Grand Rapids", "Flint"]
}

def describe_state(code)
	"#{code} is for #{@states[code]}. It has #{@cities[code].size} major cities: #{@cities[code].join(", ")} "
end

@taxes = {	  
	OR: 1.01,
  	FL: 1.02,
  	CA: 1.03,
  	NY: 1.04,
  	MI: 1.05
}

def calculate_tax(code, dollars)
	@taxes[code] * dollars.round(2)
end

def find_state_for_city(city_name)
	@cities.each do |state, city_array|
		city_array.each do |city|
			if city == city_name
				return state
			end 
		end
	end
	nil
end

puts find_state_for_city("Los Angeles")
puts calculate_tax("FL".to_sym, 200)
puts describe_state("OR".to_sym)