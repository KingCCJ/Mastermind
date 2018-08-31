class PlayerVsComp

  COLOR_OPTIONS = GameCode::COLOR_OPTIONS
  MAGIC_NUMBER = GameCode::MAGIC_NUMBER


  def initialize(messages, feedback, hist, game_code)
    @messages = messages
    @feedback = feedback
    @history = hist
    @player_guess = []
    @guess_remaining = Mastermind::GUESS_LIMIT
    @secret_code = game_code.generate_code
  end

  def play
    check_guess
  end

  def check_guess
    @messages.start_message(COLOR_OPTIONS)
    history = @history.render
    @messages.show_history(history)
    @messages.enter_guess(MAGIC_NUMBER)
    @player_guess = get_input
    # @player_guess.each do |guess|
    #   if !COLOR_OPTIONS.include? guess
    #     @feedback.not_in_list(@secret_code, @player_guess, @messages)
    #   end
    # end
    while !game_command
      if @player_guess.length != MAGIC_NUMBER 
        system ('clear')
        @feedback.incorrect_input(@player_guess, MAGIC_NUMBER, @messages)
        check_guess
      # elsif !@player_guess.include? COLOR_OPTIONS
      #   @feedback.not_in_list(@secret_code, @player_guess, COLOR_OPTIONS)
      #   @messages.not_option
      #   check_guess
      else
        system ('clear')
        game_check
      end
    end
  end 

  def game_command
    if @player_guess == ["c", "h", "e", "a", "t"]
      system ('clear')
      @messages.cheat(@secret_code)
      check_guess
    elsif @player_guess == ["q", "u", "i", "t"]
      exit(0)
    end
  end

  def game_check

    if @guess_remaining > 1
      @guess_remaining -= 1
      if win_condition
        p @secret_code
        @messages.win_message
        exit
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
        exit
      else
        p @secret_code
        @messages.lose_message
        exit
      end
    else
      p @secret_code
      @messages.lose_message
      exit
    end
  end

  def get_input
    gets.chomp.downcase.split(//)
  end

  def win_condition
    @secret_code == @player_guess
  end
end