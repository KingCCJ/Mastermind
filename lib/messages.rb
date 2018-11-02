class Messages
  def game_rule
    puts "Welcome to Mastermind\n\n"  
    sleep 1
    puts "In this game, you \(the player\), will play against the"
    puts "computer in a game of wits. The computer will choose"
    puts ",from a given list of colors, a secret color coded combo"
    puts "for you to guess.\n\n"

    puts "If you guess a correct color but in the wrong position"
    puts "you\'ll receive a white pin for every correct guess. Yet,"
    puts "for every correct color in the right position you guess"
    puts "you\'ll receive a red pin.\n\n"
  
    puts "Be sparing with your guess, though."
    puts "You only get 10 guess to get it right."
    puts "Got it? Are you ready? Let\'s play.\n\n"
    sleep 1
    puts "Press \"Enter\" to continue."
    gets
  end 
  
  def start_message(color_options)
    puts "Here are your options: #{color_options}"
    puts "Mastermind code: [* * * *]" 
    puts ''
  end

  def enter_guess(magic_number)
    print "Please enter a #{magic_number} digit guess: "
  end

  def guesses(guess_remaining)
    puts "There are #{guess_remaining} guesses remaining."
  end
  
  def feedback_too_many
    puts "You have too many items in your list! >:( STOP IT!"
  end

  def feedback_not_enough
    puts "Ehhhh, where\'s the rest of your guess???" 
  end

  def pin_feedback(pins)
    puts "You have #{pins[:white]} white and #{pins[:red]} red pins"
  end
  
  def win_message
    puts "Yay! You Won!"
  end

  def lose_message
    puts "Mastermind's Code"
    puts "What happened? You lost..."
  end

  def cheat(secret_code)
    p secret_code
  end

  def game_select
    puts "Please select a game mode by typing in its numeric value below"
    puts "1: Player V Comp"
    puts "2: Comp V Comp"
    print "Game mode:"
  end

  def computer_player_start_message(secret_code)
    system ('clear')
    puts "Secret Code: #{secret_code}"
    sleep 1
  end

  def computer_player_guess_message(guess_number, player_guess, possible_combos)
    puts "\nGuess ##{guess_number}: #{player_guess}"
    puts "There are " + possible_combos.size.to_s + " possibilites"
    sleep 1
  end

  def computer_loses(secret_code)
    puts "Uhhhh.... Guess the computer isn't that smart."
    puts "Secret Code: #{@secret_code}"
  end

  def computer_win_message(guess, tries, secret_code)
    puts "The Computer guessed the Secret Code: #{secret_code} in #{tries} tries."
  end
end
