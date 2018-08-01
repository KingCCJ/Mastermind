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

  def pin_check(player_guess, secret_code)
    current_index = 0
    white_pins = 0
    red_pins = 0

    player_guess.each do |guess|
      if secret_code.include? guess
        white_pins += 1
      end
    end

    player_guess.each do |guess|
      if guess == secret_code[current_index]
        red_pins += 1
      end
      current_index += 1
    end
    if red_pins > 0
      white_pins -= red_pins
    end
    pins = [white_pins, red_pins]
  end
end