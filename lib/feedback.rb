class Feedback
  
  def incorrect_input(player_guess, magic_number, messages)
    if player_guess.length > magic_number
      messages.feedback_too_many
    elsif player_guess.length < magic_number
      messages.feedback_not_enough
    end
  end

  # def not_in_list(secret_code, player_guess, color_options)
  #   player_guess.each do |guess|
  #     if !color_options.include? player_guess
  #       true
  #     end
  #   end
  # end

  def pin_check(player_guess, secret_code)
    test_code = secret_code.clone
    test_guess = player_guess.clone
    {red: red_pin_check(test_guess, test_code), white: white_pin_check(test_guess, test_code)}
  end

  private
  
  def red_pin_check(test_guess, test_code)
    red_pins = 0
    test_guess.each_with_index do |guess, index|
      if guess == test_code[index]
        red_pins += 1
        test_code[index] = '.'
        test_guess[index] = '!'
      end
    end
    red_pins
  end

  def white_pin_check(test_guess, test_code)
    white_pins = 0
    test_guess.each_with_index do |guess, index|
      if test_code.include? guess
        white_pins += 1
        test_code[test_code.index(guess)] = '.'
        test_guess[index] = '!'
      end
    end
    white_pins
  end
end