class History
  attr_reader :history

  def initialize
    @history = []
  end
  
  def store(player_guess)
    @history << { guess: player_guess, pins: "3, 2", turn: 1 }
  end

  def show_hist
    @history.each do |history_entry|
      p history_entry[:guess]
    end
  end
end
