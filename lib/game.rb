require_relative "./introduction"
require_relative "./mastermind"

intro = Introduction.new
intro.game_rule

game = Mastermind.new
game.play_game