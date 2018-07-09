class Mastermind
  def initialize
    @color_options = ["r", "b", "g", "y", "o", "p"]
    @secret_code = []
  end

  def generate_code
    @secret_code = @color_options.sample(4)
  end

  def play_game
    system ('clear')
    puts "Here are your options: #{@color_options}"
    generate_code
  end

end