require_relative "./mastermind"
require_relative "./messages"
# require_relative "./player_input"
require_relative "./feedback"
require_relative "./history"
# require_relative "./compvcomp"
require_relative "./comp_player"

messages = Messages.new
# player_input = PlayerInput.new
feedback = Feedback.new
hist = History.new
# comp = CompVsComp.new
c_player = ComputerPlayer.new(feedback, messages)

game = Mastermind.new(messages, feedback, hist, c_player)
game.play_game