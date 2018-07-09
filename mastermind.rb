require_relative "./introduction"

intro = Introduction.new
intro.game_rule

require_relative "./lib"

game = Mastermind.new
game.play_game