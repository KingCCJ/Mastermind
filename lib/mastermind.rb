class Mastermind
  attr_reader :secret_code
  
  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]

  def initialize
    @secret_code = []
  end

  def generate_code
    @secret_code = COLOR_OPTIONS.sample(4)
  end

  def play_game
    system ('clear')
    puts "Here are your options: #{COLOR_OPTIONS}"
    generate_code
  end

end
