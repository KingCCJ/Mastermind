require_relative "./messages"
class Mastermind
  attr_reader :secret_code
  
  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]

  def initialize
    @messages = Messages.new
    @secret_code = []
  end

  def generate_code
    @secret_code = COLOR_OPTIONS.sample(4)
  end

  def play_game
    system ('clear')
    @messages.game_rule
    @messages.start_message
    generate_code
  end
end
