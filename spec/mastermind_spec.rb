require_relative "../lib/mastermind"

RSpec.describe "Mastermind" do
  let(:messages) { double('Messages') }
  let(:player_input) { double('PlayerInput') }
  let(:game) { Mastermind.new(messages, player_input) }

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
    it "returns = win call" do 
      game.secret_code = ['R', 'O', 'R', 'Y']
      game.player_guess = ['R', 'O', 'R', 'Y']

      expect(messages).to receive(:win_message)
      game.game_check
    end

    context "when guess_remaining has 1 guess" do
      it "returns = lost call if guess is wrong" do
        game.secret_code = ['R', 'O', 'R', 'Y']
        game.player_guess = ['R', 'O', 'R', 'G']
        game.guess_remaining = 1

        expect(messages).to receive(:lose_message).once
        game.game_check
      end
    end
  end
end