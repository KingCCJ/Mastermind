class History
  attr_reader :player_history

  def initialize
    @player_history = []
  end
  
  def store(player_guess, pins)
    @player_history << { guess: player_guess, pins: pins }
  end

  def render
    @player_history.map.with_index do |history_entry, i|
     "GUESS ##{i + 1}: #{history_entry[:guess]}   W: #{history_entry[:pins][:white]} R: #{history_entry[:pins][:red]}"
    end.join("\n")
  end
end
