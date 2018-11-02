class ComputerPlayer

  COMBOS = Mastermind::COLOR_OPTIONS.repeated_permutation(4).to_a
  INITIAL_GUESS = Mastermind::COLOR_OPTIONS.sample(4)

  def initialize(feedback, messages)
    @possible_combos = COMBOS
    @messages = messages
    @pins = feedback
  end

  def play(secret_code)
    @secret_code = secret_code
    @messages.computer_player_start_message(@secret_code)
    guess_limit = 10
    guess_number = 0
    player_guess = INITIAL_GUESS
    while guess_number <= guess_limit
      pins = @pins.pin_check(player_guess, @secret_code)
      update_combos(player_guess, pins)
      check_win(player_guess, guess_number)
      player_guess = new_guess
      guess_number += 1
      @messages.computer_player_guess_message(guess_number, player_guess, @possible_combos)
    end
    @messages.computer_loses(@secret_code)
  end

  def update_combos(guess, pins)
    @possible_combos.select! do |code| 
      pins[:red] == @pins.pin_check(guess, code)[:red] && pins[:white] == @pins.pin_check(guess, code)[:white]
    end
  end

  def check_win(guess, tries)
    if guess == @secret_code
      @messages.computer_win_message(guess, tries, @secret_code) 
      exit 
    end
  end

  def new_guess
    @possible_combos.sample
  end
end