class Messages
  def game_rule
    puts "Welcome to Mastermind\n\n"  
    sleep 1
    puts "In this game, you \(the player\), will play against the"
    puts "computer in a game of wits. The computer will choose"
    puts ",from a given list of colors, a secret color coded combo"
    puts "for you to guess.\n\n"
    sleep 1
    puts "If you guess a correct color but in the wrong position"
    puts "you\'ll receive a white pin for every correct guess. Yet,"
    puts "for every correct color in the right position you guess"
    puts "you\'ll receive a red pin.\n\n"
    sleep 0.5
    puts "Be sparing with your guess, though."
    puts "You only get 10 guess to get it right."
    puts "Got it? Are you ready? Let\'s play.\n\n"
    puts "Press \"Enter\" to continue."
    gets
  end 
  
  def start_message(color_options)
    puts "Here are your options: #{color_options}"
    puts "Please enter your guess one letter at a time."
  end

  def guesses(guess_remaining)
    puts "You have #{guess_remaining} guesses remaining."
  end
  
  def win_message
    puts "Yay! You Won!"
  end
end
