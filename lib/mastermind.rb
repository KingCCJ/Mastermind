class Mastermind
  #Being used from my spec file to access and wirte test
  attr_accessor :secret_code, :player_guess, :messages, :guess_remaining

  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]

  def initialize(messages, player_input, feedback, hist)
    @messages = messages
    @player_input = player_input
    @feedback = feedback
    @history = hist
    @secret_code = []
    @player_guess = ['*', '*', '*', '*']
    @guess_remaining = 10
  end

  def generate_code
    @secret_code = COLOR_OPTIONS.sample(4)
  end

  def play_game
    system ('clear')
    @messages.game_rule
    system ('clear')
    generate_code
    check_guess
  end

  def check_guess
    @messages.start_message(COLOR_OPTIONS)
    p @secret_code
    puts ''
    @history.show_hist
    @player_guess = @player_input.get_input
    if @player_guess.length != 4
      system ('clear')
      @feedback.incorrect_input(@player_guess)
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
        @history.store(@player_guess)
        @messages.guesses(@guess_remaining)
        check_guess 
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
