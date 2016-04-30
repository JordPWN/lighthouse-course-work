require_relative 'player'
require 'colorize'

class Game

	attr_reader :new_game

	def initialize
		@players_arr = []
	end

	def new_game
		puts "How many players do you have?"
		new_players(gets.chomp.to_i)
		@players_arr.size.times do |i|
				@players_arr[i].lives = 3
		end
		puts "\nNew Game!\n\n"
		puts play_game
		scoreboard
		puts play_again
	end

	def play_game
		cur_player = 0
		alive_players = 0
		until alive_players == 1
			alive_players = 0
			@players_arr.each { |player| alive_players += 1 if player.lives > 0 }
			if @players_arr[cur_player].is_alive?
				if alive_players == 1
					@players_arr[cur_player].wins += 1
					return "#{@players_arr[cur_player].name} wins!"
				end
			 	puts "#{@players_arr[cur_player].name}'s Turn\n"
			 	puts math_battle(cur_player)
			 	cur_player = next_turn(cur_player)
			else
				cur_player = next_turn(cur_player)
			end
		end
	end

	def scoreboard
		puts "Scoreboard"
		@players_arr.size.times do |pl|
			puts "#{@players_arr[pl].name}'s Wins: #{@players_arr[pl].wins}"
		end
	end

	def math_battle(cur_player)
		answer = equation
		user_input = gets.chomp
		if user_input.to_i == answer
			return "Correct!\n\n".green 
		else
			@players_arr[cur_player].lives -= 1
			return "Wrong!\n".red + "#{@players_arr[cur_player].name}'s Lives: #{@players_arr[cur_player].lives}\n\n"
		end
	end

	def next_turn(cur_player)
	 	if cur_player != @players_arr.size - 1
	 		cur_player += 1
	 	else
	 		cur_player = 0
	 	end
	end

	def equation
		digit1 = rand(1..20)
		digit2 = rand(1..20)
		operator = [:+, :-, :*].sample
		puts "What is #{digit1} #{operator} #{digit2}?"
		return digit1.send(operator, digit2)
	end

	def new_players(amount_of_players) #loop over number of players 
		if @players_arr.size < amount_of_players
			amount_of_players.times do
				@players_arr << Player.new("", 0, 0)
			end
		end
		amount_of_players.times do |cur_player|
			if @players_arr[cur_player].name == ""
				puts "Please input your name:"
				@players_arr[cur_player].name = gets.chomp
			end
		end
	end

	def play_again
		puts "Play again? 1.Yes 2.No"
		user_input = gets.chomp.downcase
		if user_input == "1" || user_input == "yes" then new_game else return "Thanks for playing!" end
	end
end

Game.new.new_game if $0 == __FILE__