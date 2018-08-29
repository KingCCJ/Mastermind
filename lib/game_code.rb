class GameCode

  COLOR_OPTIONS = ["r", "b", "g", "y", "o", "p"]
  MAGIC_NUMBER = 4
  
  def generate_code
    combos = COLOR_OPTIONS.repeated_permutation(MAGIC_NUMBER).to_a
    @secret_code = combos.sample
  end
end