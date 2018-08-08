class Feedback
  def incorrect_input(player_guess, magic_number, messages)
    if player_guess.length > magic_number
      messages.feedback_too_many
    elsif player_guess.length < magic_number
      messages.feedback_not_enough
    end
  end

  def pin_check(player_guess, secret_code)
    white_pins = 0
    red_pins = 0

    player_guess.each do |guess|
      if secret_code.include? guess
        white_pins += 1
      end
    end

    player_guess.each_with_index do |guess, index|
      if guess == secret_code[index]
        red_pins += 1
      end
    end
    if red_pins > 0
      white_pins -= red_pins
    end
    pins = {white: white_pins, red: red_pins}
  end
end