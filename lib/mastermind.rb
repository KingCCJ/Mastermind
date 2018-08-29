class Mastermind
  #Being used from my spec file to access and wirte test
  attr_accessor :secret_code, :player_guess, :messages, :guess_remaining

  GUESS_LIMIT = 10

  def initialize(player_v_comp, comp_v_player, player_v_player, c_player, messages)
    @pvc = player_v_comp
    @pvp = player_v_player
    @cvp = comp_v_player
    @comp_game = c_player
    @messages = messages
  end

  def play_game
    @messages.game_rule(GUESS_LIMIT)
    game_mode
  end

  def game_mode
    @messages.game_select
    mode = gets.chomp.to_i
    if mode == 1
      system ('clear')
      @pvc.play
    elsif mode == 2
      @pvp.play
    elsif mode == 3
      @cvp.play
    elsif mode == 4
      @comp_game.play
    end
  end
end
