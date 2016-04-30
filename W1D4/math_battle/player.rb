class Player

	attr_accessor :name, :lives, :wins

	def initialize(name, lives, wins)	
		@name = name
		@lives = lives
		@wins = wins
	end
	
	def is_alive?
		@lives > 0 ? true : false
	end

end