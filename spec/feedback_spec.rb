require_relative "../lib/feedback"

RSpec.describe "Feedback" do
  let(:feedback) {Feedback.new}
  let(:messages) { double('Messages') }

  describe "#pin_check" do
    it "counts the number of red pins" do
      feedback.pin_check(['r'], ['r'])

      expect(feedback.pin_check(['r'], ['r'])).to eq({red: 1, white: 0})
    end

    it "counts the number of white pins" do
      feedback.pin_check(['r', 'o'], ['b', 'r'])

      expect(feedback.pin_check(['r', 'o'], ['b', 'r'])).to eq({red: 0, white: 1})
    end
  end

  describe "#incorrect_input" do
    it "checks the input length is long enough" do
      guess = ['a']

      expect(messages).to receive(:feedback_not_enough)
      feedback.incorrect_input(guess, 2, messages)
    end

    it "checks the input length is short enough" do
      guess = ['a', 'b', 'c']

      expect(messages).to receive(:feedback_too_many)
      feedback.incorrect_input(guess, 2, messages)
    end
  end
end