require_relative "./messages"
class Mastermind
  attr_reader :secret_code
  
  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]

  def initialize
    @messages = Messages.new
    @secret_code = []
    @player_guess = Array.new(4)
    @guess_remaining = 10
  end

  def generate_code
    @secret_code = COLOR_OPTIONS.sample(4)
  end

  def play_game
    system ('clear')
    @messages.game_rule
    system ('clear')
    @messages.start_message(COLOR_OPTIONS)
    generate_code
    p @secret_code
    player_guess
  end

  def player_guess
    player_code = gets.chomp
    array_index = 0
    while array_index <= 3
      @player_guess[array_index] = player_code
      if array_index < 3
        player_code = gets.chomp
        array_index += 1
      else
        break
      end
    end
    p @player_guess
    game_check
  end 

  def game_check
    while @guess_remaining > 0
      @guess_remaining -= 1
      if win_condition == true
        break
      elsif win_condition != true
        @messages.guesses(@guess_remaining)
        player_guess 
      end
    end
  end

  def win_condition
    if @secret_code == @player_guess
      @messages.win_message
      true
    else
      false
    end
  end
end
