@pop = 0
@bottles = 0
@caps = 0
@pop_purchased = 0
@from_bottles = 0
@from_caps = 0

def buy_pop(dollars)	
	@pop = dollars/2.floor
	@pop_purchased += @pop
	while @pop != 0
		recycle(@pop)
	end
end

def recycle(pop)
	@bottles += pop
	@caps += pop
	@pop = 0
	bottle_return(@bottles)
	cap_return(@caps)

end

def bottle_return(bottles)
	while bottles >= 2
		bottles -= 2
		@pop += 1
		@pop_purchased += 1
		@from_bottles += 1
	end
	@bottles = bottles
end

def cap_return(caps)
	while caps >= 4
		caps -= 4
		@pop += 1
		@pop_purchased += 1
		@from_caps += 1
	end
	@caps = caps
end

buy_pop(12)

puts "Current pop: #{@pop}\n Pop purchased: #{@pop_purchased}\n Current Bottles: #{@bottles}\n Current Caps: #{@caps}\n Pop from Bottle Returns: #{@from_bottles}\n Pop from Cap Returns: #{@from_caps}"