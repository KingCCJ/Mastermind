require_relative "../lib/history"

RSpec.describe 'History' do
  let(:history) { History.new }

  describe "#store" do
    it "stores guess and pin number" do
      pins = { red: 2, white: 1 }
      history.store('r', pins)

      expect(history.player_history).to eq([{ guess: 'r', pins: pins}])
    end

    it "stores multiple guesses and pin numbers" do
      pins1 = { red: 2, white: 1 }
      pins2 = { red: 0, white: 3 }
     
      history.store('r', pins1)
      history.store('g', pins2)

      expect(history.player_history).to eq([{ guess: 'r', pins: pins1 }, 
                                            { guess: 'g', pins: pins2 }])
    end
  end

   describe "#render" do
    before(:each) do
      pins1 = { red: 2, white: 1 }
      pins2 = { red: 0, white: 3 }
     
      history.store('r', pins1)
      history.store('g', pins2)
    end

    let(:rendered_history) { history.render }

     it 'shows the guess and guess count for all guesses' do
        expect(rendered_history).to include('GUESS #1: r')
        expect(rendered_history).to include('GUESS #2: g')
     end

     it 'shows the red white pin count for each guess' do
        expect(rendered_history).to include('W: 1 R: 2')
        expect(rendered_history).to include('W: 3 R: 0')
     end
   end
end
