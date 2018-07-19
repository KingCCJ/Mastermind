require_relative "./mastermind"
require_relative "./messages"
require_relative "./PlayerInput"
messages = Messages.new
player_input = PlayerInput.new

game = Mastermind.new(messages, player_input)
game.play_game