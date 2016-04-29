class Player
	attr_accessor :name, :lives, :wins
	def initialize(name, lives, wins)	
		@name = name
		@lives = lives
		@wins = wins
	end
end

class Game
	attr_reader :new_game
	def initialize
		@p1 = Player.new("", 0, 0)
		@p2 = Player.new("", 0, 0)
	end
	def new_game
		if @p1.name == ""
			new_players
		end
		@p1.lives, @p2.lives = 3, 3
		puts "New Game!\n\n"
		play_game
	end

	def play_game
		player1 = true
		until @p1.lives == 0 || @p2.lives == 0
			math_battle(player1)
			player1 = !player1
		end
		if @p1.lives == 0
			puts "#{@p2.name} wins!" 
			@p2.wins += 1
			puts "#{@p1.name} Wins: #{@p1.wins}\n#{@p2.name} Wins: #{@p2.wins}"
		else 
			puts "#{@p1.name} wins!"
			@p1.wins += 1
			puts "#{@p1.name} Wins: #{@p1.wins}\n#{@p2.name} Wins: #{@p2.wins}"
		end
		play_again
	end

	def math_battle(player1)
		digit1 = rand(1..20)
		digit2 = rand(1..20)
		if player1 then puts @p1.name else puts @p2.name end
		puts "What is #{digit1} + #{digit2}?"
		user_input = gets.chomp
		if user_input.to_i == digit1 + digit2
			puts "Correct!" 
		else
			puts "Wrong!"
			player1 ? @p1.lives -= 1 : @p2.lives -= 1
			if player1 then puts "Lives: #{@p1.lives}" else puts "Lives: #{@p2.lives}" end
		end
	end
	def new_players
		puts "Player 1, enter your name: "
		@p1.name = gets
		puts "Player 2, enter your name: "
		@p2.name = gets
	end

	def play_again
		puts "Play again? 1.Yes 2.No"
		user_input = gets.chomp.downcase
		if user_input == "1" || user_input == "yes" then new_game else return "Thanks for playing!" end
	end
end

my_game = Game.new

my_game.new_game