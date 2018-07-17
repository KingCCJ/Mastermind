require_relative "./messages"
class Mastermind
  #Being used from my spec file to access and wirte test
  attr_accessor :secret_code, :player_guess, :messages, :guess_remaining

  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]

  def initialize
    @messages = Messages.new
    @secret_code = []
    @player_guess = Array.new(4)
    @guess_remaining = 10
    @history = []
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
    @player_guess = gets.chomp.downcase.split(//)
    p @player_guess
    game_check
  end 

  def game_check
    if @guess_remaining > 1
      @guess_remaining -= 1
      if win_condition
        @messages.win_message
      else
        #Making a note to return to later; 
        #I added history so that I can store the guesses
        #and return them after each incorrect guess
        @history << @player_guess
        @messages.guesses(@guess_remaining)
        player_guess 
      end
    else
      @messages.lose_message
    end
  end

  def win_condition
    @secret_code == @player_guess
  end
end
