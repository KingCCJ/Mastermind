require_relative "../lib/mastermind"

RSpec.describe "Mastermind" do
  let(:game) { Mastermind.new }

  describe "#generate_code" do
    it "creates a 4 digit secret code for the player to guess" do
      game.generate_code
      expect(game.secret_code.length).to eq 4
    end
  end

  describe "#win_condition" do
    context "when player guess matches secret code" do
      it "would return true" do
        game.secret_code = ['R', 'O', 'R', 'Y']
        game.player_guess = ['R', 'O', 'R', 'Y']

        expect(game.win_condition).to eq(true)
      end
    end

    context "When player code does not match secret_code" do
      it "would return false" do
        game.secret_code = ['R', 'O', 'R', 'Y']
        game.player_guess = ['R', 'O', 'R', 'G']

        expect(game.win_condition).to eq(false)
      end
    end
  end

  describe "#game_check" do
    it "returns win message when game is won" do 
      game.secret_code = ['R', 'O', 'R', 'Y']
      game.player_guess = ['R', 'O', 'R', 'Y']

      expect(game.messages).to receive(:win_message)
      game.game_check
    end

    it "returns lose message when game is lost" do
      game.secret_code = ['R', 'O', 'R', 'Y']
      game.player_guess = ['R', 'O', 'R', 'G']

      expect(game.messages).to receive(:lose_message)
      game.game_check
    end
  end
end