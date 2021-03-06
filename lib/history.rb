class History
  attr_reader :player_history

  def initialize
    @player_history = []
  end
  
  def store(player_guess, pins)
    @player_history << {guess: player_guess, pins: pins}
  end

  def show_hist
    @player_history.each do |history_entry|
      puts "GUESS: #{history_entry[:guess]}    W: #{history_entry[:pins][:white]} R: #{history_entry[:pins][:red]}"
    end
  end
end
