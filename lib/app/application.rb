class Application
  attr_accessor :current_game, :player_will

  def initialize
    welcome_message
    @player_will = get_player_will 

    if @player_will =="o"
      name_player1 = get_player_name(1)
      name_player2 = get_player_name(2)

      # Création d'une nouvelle partie
      @current_game = Game.new(name_player1, name_player2)
      puts "                UNE NOUVELLE PARTIE COMMENCE !"
      puts "[ENTER]"
      self.start_rounds
      gets

    elsif @player_will == "n"
      good_bye_message
    end
  end

  # Méthode qui souhaite la bienvenue
  def welcome_message

    puts "\n\n                **********************************************"
    puts "                **                                          **"
    puts "                ***     UN MORPION CA GRATTOUILLE ET      ****"
    puts "                ****    TE SOUHAITE LA BIENVENUE ! :)    *****"
    puts "                *****                                   ******"
    puts "                **********************************************"
    puts "\n[ENTER]"
    gets

    puts "                 REGLES DU JEU"
    puts "               |"
    puts "               | 2 joueurs placent un pion sur la grille chacun leur tour."
    puts "               | Le gagnant est celui qui aligne 3 pions le premier."
    puts "               |"
    puts "               | BONNE CHANCE !  :)"
    puts "               |"
    puts "\n[ENTER]"
    gets
  end

  # Méthode qui salue les joueurs quand le programme s'arrête
  def good_bye_message
    
    puts "\n\n                **********************************************"
    puts "                **                                          **"
    puts "                ***       LE MORPION TE REMERCIE DE       ****"
    puts "                ****         L'AVOIR GRATTÉ :) !         *****"
    puts "                *****                                   ******"
    puts "                **********************************************"
    puts "\n[ENTER]"
    gets
  end

  # Méthode qui recueille le souhait de l'utilisateur à jouer
  def get_player_will
    print "                Lancer une partie ? o / n > "
    player_answer = gets.chomp

    while player_answer != "o" && player_answer != "n"
      print "                o = OUI / n = NON         > "
      player_answer = gets.chomp
    end
    return player_answer
  end

  # Méthode qui demande le nom d'un joueur
  def get_player_name(player_num)
    print "                Nom du joueur #{player_num} > "
    return gets.chomp
  end

  # Méthode qui lance le premier tour de morpion
  def start_rounds
    round = 1
    while self.current_game.status == true
      self.current_game.play_round(round)
      round += 1
    end
  end
end