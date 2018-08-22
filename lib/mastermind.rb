class Mastermind
  #Being used from my spec file to access and wirte test
  attr_accessor :secret_code, :player_guess, :messages, :guess_remaining

  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]
  MAGIC_NUMBER = 4

  def initialize(messages, player_input, feedback, hist, comp)
    @messages = messages
    @player_input = player_input
    @feedback = feedback
    @history = hist
    @comp_game = comp
    @secret_code = []
    @player_guess = []
    @guess_remaining = 10
  end

  def generate_code
    @secret_code = COLOR_OPTIONS.sample(MAGIC_NUMBER)
  end

  def play_game
    system ('clear')
    @messages.game_rule
    system ('clear')
    generate_code
    game_mode
  end

  def game_mode
    @messages.game_select
    mode = gets.chomp.to_i
    if mode == 1
      system('clear')
      check_guess
    elsif mode == 2
      @comp_game.play_game(@secret_code, @guess_remaining, @history, @feedback, COLOR_OPTIONS, MAGIC_NUMBER)
    end
  end

  def check_guess
    @messages.start_message(COLOR_OPTIONS)
    @history.show_hist
    @messages.enter_guess(MAGIC_NUMBER)
    @player_guess = @player_input.get_input
    if @player_guess == ["c", "h", "e", "a", "t"]
      system ('clear')
      @messages.cheat(@secret_code)
      check_guess
    elsif @player_guess == ["q", "u", "i", "t"]
      exit(0)
    elsif @player_guess.length != MAGIC_NUMBER
      system ('clear')
      @feedback.incorrect_input(@player_guess, MAGIC_NUMBER, @messages)
      check_guess
    else
      system ('clear')
      game_check
    end
  end 

  def game_check

    if @guess_remaining > 1
      @guess_remaining -= 1
      if win_condition
        p @secret_code
        @messages.win_message
      else
        pins = @feedback.pin_check(@player_guess, @secret_code)
        @history.store(@player_guess, pins)
        @messages.pin_feedback(pins)
        @messages.guesses(@guess_remaining)
        check_guess 
      end
    elsif @guess_remaining == 1
      if win_condition
        p @secret_code
        @messages.win_message
      else
        p @secret_code
        @messages.lose_message
      end
    else
      p @secret_code
      @messages.lose_message
    end
  end

  def win_condition
    @secret_code == @player_guess
  end
end
