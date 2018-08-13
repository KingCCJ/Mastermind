class CompVsComp
  def play_game(secret_code, guess_remaining, history, feedback, color_options, magic_number) 
    @secret_code = secret_code
    @guess_remaining = guess_remaining
    @color_options = color_options
    @magic_number = magic_number
    @history = history
    @feedback = feedback
    @player_guess = []
    check_comp_guess
  end 

  def check_comp_guess
    system('clear')
    puts "Here is the Secret Code:"
    p @secret_code
    puts ""
    @player_guess = @color_options.sample(@magic_number)
    puts "Here is the Computer's current guess"
    p @player_guess
    puts""
    puts "Guess remaining: #{@guess_remaining}"
    @history.show_hist
    sleep 1
    game_check
  end
  
  def game_check
    if @guess_remaining > 1
      @guess_remaining -= 1
      if win_condition
        total_turns = 10 - @guess_remaining
        puts "The Computer guessed the code in " + total_turns.to_s + " turns"
      else
        pins = @feedback.pin_check(@player_guess, @secret_code)
        @history.store(@player_guess, pins)
        check_comp_guess
      end
    elsif @guess_remaining == 1
      @player_guess = @secret_code
      system('clear')
      puts "Here is the Secret Code:"
      p @secret_code
      puts ""
      puts "Here is the Computer's current guess"
      p @player_guess
      puts""
      puts "Guess remaining: #{@guess_remaining}"
      @history.show_hist
      if win_condition
        puts "The Computer guessed the code in 10 turns"
      end
    end
  end
  
  def win_condition
    @secret_code == @player_guess
  end
end