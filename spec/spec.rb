require_relative "../lib/mastermind"

RSpec.describe "Mastermind" do
  context "generate_code" do
    it "creates a 4 digit secret code for the player to guess" do
      code = Mastermind.new
      code.generate_code
      expect(code.secret_code.length).to eq 4
    end
  end
end