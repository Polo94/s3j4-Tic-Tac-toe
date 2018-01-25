#Ceci est un tic tac toe

class Board #présentation du plateau et des règles

	def initialize 
		puts "\n"
		puts "###################################"
		puts " Bienvenue dans le jeu Tic Tac Toe"
		puts "###################################"
		puts "\n"
		puts "1) Chaque joueur jouera a son tour et devra écrire le nom de la case qu'il souhaite remplir"
		puts "\n" 
		puts "2) Chaque joueur devra taper le nom de la case choisie EN LETTRES CAPITALES"
		puts "\n"
		puts "3) Le premier joueur qui alignera 3 (trois) cases consécutives à l'horizontale, ou en diagonale, ou à la verticale gagne la partie"
		puts "\n"
		puts "* Exemple : si choix de la case A1 par le joueur, il doit taper A1 et appuyer sur la touche ENTREE"
		puts "\n"
		puts "      A    B    C"
		puts "    ###############"
		puts "  1 # X ##   ##   #"
		puts "    ###############"
		puts "  2 #   ##   ##   #"
		puts "    ###############"
		puts "  3 #   ##   ##   #"
		puts "    ###############"
	end



end


class BoardCase

	def initialize # méthode qui initialise le tableau de départ et le déroulement des tours de jeu
		# création du hash (tableau de base) avec les 9 cases du jeu
		@my_hash = { "A1" => "_" , "A2" => "_", "A3" => "_", "B1" => "_", "B2" => "_", "B3" => "_", "C1" => "_", "C2" => "_", "C3" => "_"}
		# appel de l'enchaînement des 9 parties
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

	def puts_board # méthode d'affichage du tableau qui affichera les coups joués à chaque tour
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

	def new_round_p1 # méthode qui définit l'action du joueur : choisir une case et écrire "X" ou "o" pour prendre celle-ci
		
		puts "Joueur 1 : Ecris le nom de ta case (EN MAJUSCULE)"
		choice = gets.chomp.to_s # enregistrement du choix de la case choisie par le joueur 1 et conversion en string pour l'utiliser dans le hash
		if @my_hash[choice] == "_" # si la case est disponible (_) le joueur peut la jouer et remplacer le "_" par un "X"
			@my_hash[choice] = "X" # voir ligne ci-dessus : "X" qui remplace le "_"
			
			
		else
			puts "La case est prise ou inexistante. Merci de jouer une autre case"
			new_round_p1 # relance du new round P1
		end
		puts_board # affichage du hash avec toutes les cases jouées et/ou vides (_)
		check_win_p1 #lance la methode qui verifie si le joueur 1 a gagné
	end

	def new_round_p2 # méthode pour le tour de jeu du joueur 2
		puts "Joueur 2 : Ecris le nom de ta case (EN MAJUSCULE)"
		choice = gets.chomp.to_s # enregistrement du choix de la case choisie par le joueur 2 et conversion en string pour l'utiliser dans le hash
		if @my_hash[choice] == "_" # si la case est disponible (_) le joueur 2 peut la jouer et remplacer le "_" par un "o"
			@my_hash[choice] = "o" # voir ligne ci-dessus : "o" qui remplace le "_"
			
		else
			puts "La case est prise ou inexistante. Merci de jouer une autre case"
			new_round_p2 # relance le tour de jeu du joueur 2
		end
		puts_board # affichage du hash avec toutes les cases jouées et/ou vides (_)
		check_win_p2 #lance la methode qui verifie si le joueur 1 a gagné
	end

	def check_win_p1 # méthode qui vérifie à chaque tour si le joueur 1 a une combinaison gagnante ci-dessous
		if @my_hash["A1"] == "X" && @my_hash["A2"] == "X" && @my_hash["A3"] == "X" || @my_hash["B1"] == "X" && @my_hash["B2"] == "X" && @my_hash["B3"] == "X" || @my_hash["C1"] == "X" && @my_hash["C2"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B1"] == "X" && @my_hash["C1"] == "X" || @my_hash["A2"] == "X" && @my_hash["B2"] == "X" && @my_hash["C2"] == "X" || @my_hash["A3"] == "X" && @my_hash["B3"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B2"] == "X" && @my_hash["C3"] == "X" || @my_hash["C1"] == "X" && @my_hash["B2"] == "X" && @my_hash["A3"] == "X"
				puts "le joueur 1 gagne! Bravo!" # phrase affichée lorsque la méthode détecte que le joueur 1 a gagné
				start_new_game # on rappelle un nouveau jeu avec un tableau vide
		end
	end


	def check_win_p2 # méthode qui vérifie à chaque tour si le joueur 2 a une combinaison gagnante ci-dessous
		if @my_hash["A1"] == "o" && @my_hash["A2"] == "o" && @my_hash["A3"] == "o" || @my_hash["B1"] == "o" && @my_hash["B2"] == "o" && @my_hash["B3"] == "o" || @my_hash["C1"] == "o" && @my_hash["C2"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B1"] == "o" && @my_hash["C1"] == "o" || @my_hash["A2"] == "o" && @my_hash["B2"] == "o" && @my_hash["C2"] == "o" || @my_hash["A3"] == "o" && @my_hash["B3"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B2"] == "o" && @my_hash["C3"] == "o" || @my_hash["C1"] == "o" && @my_hash["B2"] == "o" && @my_hash["A3"] == "o"
				puts "Le joueur 2 gagne! Bravo!" # phrase affichée lorsque la méthode détecte que le joueur 2 a gagné
				start_new_game # on appelle la méthode "start a new game" qui relance le jeu avec un nouveau tableau vide
		end
	end
	
	def start_new_game # méthode qui relance un nouveau jeu sous conditions
			puts "Veux-tu rejouer ? Tape 'YES' ou 'NO' (EN MAJUSCULE)"
		start_again = gets.chomp.to_s # on récupère la réponse du joueur "YES" ou "NO"

		if start_again == "YES" # si choix "YES" on relance le jeu avec boardcase.new
			BoardCase.new 
		elsif start_again == "NO" # si choix non, le programme est quitté
			puts "\n"
			abort("Bisous... Petit joueur/se!") # message de fin si le jeu est quitté (choix "NO")
		else
			puts "Tu n'as pas choisi YES ou NO"
			start_new_game # on appelle la méthode "start new game" qui relance le jeu avec un nouveau tableau vide
		end
	end



end

class Player 
	def initialize(numero_joueur) # méthode qui initialise le nom du joueur
		puts "\n"
		puts "Joueur #{numero_joueur}, entre ton nom :"
		@player_name = gets.chomp.to_s # on enregistre le nom du joueur qui a été tapé
	end
end


class Game

	def initialize # on initialise les différentes commandes du jeu	
	new_game = Board.new # lancement des règles du jeu
	player1 = Player.new(1) # initialisation du joueur 1
	player2 = Player.new(2) # initialisation du joueur 2
	board = BoardCase.new # lancement d'une partie avec tableau vide
	
	game_nul # si les 9 coups ont été joués, on appelle la méthode game_nul qui propose des options (rejouer ou quitter)
	end

	def game_nul # méthode qui est utilisée lorsque le jeu détecte une égalité
		puts "Egalité! Personne n'a gagné!"
		puts "Voulez-vous rejouer ? Tape 'YES' ou 'NO' (EN MAJUSCULE)"
		start_again = gets.chomp.to_s # enregistre le choix du joueur ("YES" ou "NO")

		if start_again == "YES" # condition pour recommencer le jeu
			BoardCase.new 
		else # si choix "NO" affiche phrase ci dessous avant de quitter le jeu
			puts "Ne me quitte pas!"
		end
	end

end

start = Game.new # bouton on : lancement du jeu