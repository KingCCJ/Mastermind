class Introduction
  def game_rule
  system('clear')
  puts ""
  puts "Welcome to Mastermind"  
  puts ""
  sleep 1
  puts "In this game, you \(the player\), will play against the"
  puts "computer in a game of wits. The computer will choose"
  puts ",from a given list of colors, a secret color coded combo"
  puts "for you to guess."
  sleep 3
  puts ""
  puts "If you guess a correct color but in the wrong position"
  puts "you\'ll receive a white pin for every correct guess. Yet,"
  puts "for every correct color in the right position you guess"
  puts "you\'ll receive a red pin."
  sleep 3
  puts ""
  puts "Be sparing with your guess, though."
  puts "You only get 10 guess to get it right."
  puts "Got it? Are you ready? Let\'s play."
  puts ""
  puts "Press \"Enter\" to continue."
  gets
  end 
end