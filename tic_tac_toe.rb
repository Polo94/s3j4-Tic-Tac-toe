class Board

	def initialize 
		puts "\n"
		puts "###################################"
		puts " Bienvenue dans le jeu Tic Tac Toe"
		puts "###################################"
		puts "\n"
		puts "1) Chaque joueur jouera a son tour et devra écrire le nom de la case qu'il souhaite remplir"
		puts "\n" 
		puts "2) Chaque joueur devra écrire le nom de la case choisie"
		puts "\n"
		puts "* Exemple : si choix de la case A1, le joueur doit entrer A1"
		puts "\n"
		puts "      A    B    C"
		puts "    ###############"
		puts "  1 #   ##   ##   #"
		puts "    ###############"
		puts "  2 #   ##   ##   #"
		puts "    ###############"
		puts "  3 #   ##   ##   #"
		puts "    ###############"
	end



end


class BoardCase

	def initialize

		@my_hash = { "A1" => "_" , "A2" => "_", "A3" => "_", "B1" => "_", "B2" => "_", "B3" => "_", "C1" => "_", "C2" => "_", "C3" => "_"}
		new_round_p1
		new_round_p2
		new_round_p1
		new_round_p2
		new_round_p1
		new_round_p2
		new_round_p1
		new_round_p2
		new_round_p1
	end

	def puts_board
		puts "\n"
		puts "      A    B    C"
		puts "    ###############"
		puts "  1 # #{@my_hash["A1"]} ## #{@my_hash["B1"]} ## #{@my_hash["C1"]} #"
		puts "    ###############"
		puts "  2 # #{@my_hash["A2"]} ## #{@my_hash["B2"]} ## #{@my_hash["C2"]} #"
		puts "    ###############"
		puts "  3 # #{@my_hash["A3"]} ## #{@my_hash["B3"]} ## #{@my_hash["C3"]} #"
		puts "    ###############"
	end

	def new_round_p1
		
		puts "Joueur 1 : Tape le nom de ta case"
		choice = gets.chomp.to_s # ==> A2
		if @my_hash[choice] == "_" # if @my_hash["A2"] == " "
			@my_hash[choice] = "X" # @my_hash["A2"] = "X"
			
			
		else
			puts "La case est prise ou inexistante. Merci de jouer une autre case"
			new_round_p1 #je relance new round P1
		end
		puts_board
		check_win_p1 #lance la methode qui verifie si le joueur 1 a gagné
	end

	def new_round_p2
		puts "Joueur 2 : Tape le nom de ta case"
		choice = gets.chomp.to_s
		if @my_hash[choice] == "_"
			@my_hash[choice] = "o"
			
		else
			puts "La case est prise ou inexistante. Merci de jouer une autre case"
			new_round_p2
		end
		puts_board
		check_win_p2
	end

	def check_win_p1
		if @my_hash["A1"] == "X" && @my_hash["A2"] == "X" && @my_hash["A3"] == "X" || @my_hash["B1"] == "X" && @my_hash["B2"] == "X" && @my_hash["B3"] == "X" || @my_hash["C1"] == "X" && @my_hash["C2"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B1"] == "X" && @my_hash["C1"] == "X" || @my_hash["A2"] == "X" && @my_hash["B2"] == "X" && @my_hash["C2"] == "X" || @my_hash["A3"] == "X" && @my_hash["B3"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B2"] == "X" && @my_hash["C3"] == "X" || @my_hash["C1"] == "X" && @my_hash["B2"] == "X" && @my_hash["A3"] == "X"
			puts "le joueur 1 gagne! Bravo!"
			start_new_game
		end
	end


	def check_win_p2
		if @my_hash["A1"] == "o" && @my_hash["A2"] == "o" && @my_hash["A3"] == "o" || @my_hash["B1"] == "o" && @my_hash["B2"] == "o" && @my_hash["B3"] == "o" || @my_hash["C1"] == "o" && @my_hash["C2"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B1"] == "o" && @my_hash["C1"] == "o" || @my_hash["A2"] == "o" && @my_hash["B2"] == "o" && @my_hash["C2"] == "o" || @my_hash["A3"] == "o" && @my_hash["B3"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B2"] == "o" && @my_hash["C3"] == "o" || @my_hash["C1"] == "o" && @my_hash["B2"] == "o" && @my_hash["A3"] == "o"
				puts "le joueur 2 gagne! Bravo!"
				start_new_game
		end
	end
	
	def start_new_game
			puts "Voulez-vous rejouer ? Tape YES ou NO"
		start_again = gets.chomp.to_s

		if start_again == "YES"
			BoardCase.new 
		elsif start_again == "NO"
			puts "\n"
			abort("Bisous... Petit joueur/se!") 
		else
			puts "Vous n'avez pas choisi YES ou NO"
			start_new_game
		end
	end



end

class Player
	def initialize(numero_joueur)
		puts "\n"
		puts "Joueur #{numero_joueur}, entrez votre nom :"
		@player_name = gets.chomp.to_s

	end

end


class Game

	def initialize
		
	new_game = Board.new
	player1 = Player.new(1)
	player2 = Player.new(2)
	board = BoardCase.new
	
	game_nul
	end

	def game_nul
		puts "Egalité! Personne n'a gagné!"
		puts "Voulez-vous rejouer ? Tape YES ou NO"
		start_again = gets.chomp.to_s

		if start_again == "YES"
			BoardCase.new 
		else
			puts "Ne me quitte pas!"
		end
	end

end

start = Game.new