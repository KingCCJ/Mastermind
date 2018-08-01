class History
  attr_reader :history

  def initialize
    @history = []
  end
  
  def store(player_guess, pins)
    @history << { guess: player_guess, pins: pins}
  end

  def show_hist
    @history.each do |history_entry|
      puts "GUESS: #{history_entry[:guess]}    W: #{history_entry[:pins][0]} R: #{history_entry[:pins][1]}"
    end
  end
end
