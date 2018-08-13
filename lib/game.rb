require_relative "./mastermind"
require_relative "./messages"
require_relative "./player_input"
require_relative "./feedback"
require_relative "./history"
require_relative "./compvcomp"

messages = Messages.new
player_input = PlayerInput.new
feedback = Feedback.new
hist = History.new
comp = CompVsComp.new

game = Mastermind.new(messages, player_input, feedback, hist, comp)
game.play_game