class CompVsPlayer
  def initialize(messages, feedback, game_code)
    @messages = messages
    @feedback = feedback
    @game_code = game_code
    @secret_code = @game_code.generate_code
  end

  def play
    puts "coming soon"
  end
end