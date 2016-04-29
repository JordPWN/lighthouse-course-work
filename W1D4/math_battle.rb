@p1_lives = 0
@p2_lives = 0

def new_game
	player1 = true
	@p1_lives, @p2_lives = 3, 3
	until @p1_lives == 0 || @p2_lives == 0
		math_battle(player1)
		player1 = !player1
	end
	if @p1_lives == 0 then puts "Player 2 wins!" else puts "Player 1 wins!" end
end

def math_battle(player1)
	digit1 = rand(1..20)
	digit2 = rand(1..20)
	if player1 then puts "Player 1" else puts "Player 2" end
	puts "What is #{digit1} + #{digit2}?"
	user_input = gets.chomp
	if user_input.to_i == digit1 + digit2
		puts "Correct!" 
	else
		puts "Wrong!"
		player1 ? @p1_lives -= 1 : @p2_lives -= 1
		if player1 then puts "Lives: #{@p1_lives}" else puts "Lives: #{@p2_lives}" end
	end
end

new_game