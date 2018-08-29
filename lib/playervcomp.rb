class PlayerVsComp

  COLOR_OPTIONS = GameCode::COLOR_OPTIONS
  MAGIC_NUMBER = GameCode::MAGIC_NUMBER


  def initialize(messages, feedback, hist, game_code)
    @messages = messages
    @feedback = feedback
    @history = hist
    @game_code = game_code
    @player_guess = []
    @guess_remaining = Mastermind::GUESS_LIMIT
    @secret_code = @game_code.generate_code
  end

  def play
    check_guess
  end

  def check_guess
    @messages.start_message(COLOR_OPTIONS)
    @history.show_hist
    @messages.enter_guess(MAGIC_NUMBER)
    @player_guess = get_input
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

  def get_input
    gets.chomp.downcase.split(//)
  end

  def win_condition
    @secret_code == @player_guess
  end
end