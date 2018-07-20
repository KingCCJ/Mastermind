require_relative "./messages"
class Feedback
  def initialize
    @messages = Messages.new 
  end

  def incorrect_input(player_guess)
    if player_guess.length > 4
      @messages.feedback_too_many
    elsif player_guess.length < 4
      @messages.feedback_not_enough
    end
  end
  
  def no_pins 
    #Beginning to write feedback for when the 
    #player doesn't receive any correct guesses
  end
end