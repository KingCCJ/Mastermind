require_relative "./mastermind"
require_relative "./messages"
require_relative "./player_input"
require_relative "./feedback"
require_relative "./history"

messages = Messages.new
player_input = PlayerInput.new
feedback = Feedback.new
hist = History.new

game = Mastermind.new(messages, player_input, feedback, hist)
game.play_game