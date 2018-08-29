require_relative "./mastermind"
require_relative "./messages"
require_relative "./feedback"
require_relative "./history"
require_relative "./game_code"
require_relative "./compvplayer"
require_relative "./comp_player"
require_relative "./pvp"
require_relative "./playervcomp"

messages = Messages.new
feedback = Feedback.new
hist = History.new
game_code = GameCode.new
player_v_comp = PlayerVsComp.new(messages, feedback, hist, game_code)
player_v_player = PlayerVsPlayer.new(messages, feedback, hist, game_code)
comp_v_player = CompVsPlayer.new(messages, feedback, game_code)
c_player = ComputerPlayer.new(feedback, messages, game_code)

game = Mastermind.new(player_v_comp, comp_v_player, player_v_player, c_player, messages)
game.play_game