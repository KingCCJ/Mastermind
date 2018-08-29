class PlayerVsPlayer
  def initialize(messages, feedback, hist, game_code)
    @messages = messages
    @feedback = feedback
    @history = hist
    @game_code = game_code
    @secret_code = @game_code.generate_code
  end

  def play
    puts "coming soon"
  end
end