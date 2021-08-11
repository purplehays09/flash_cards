require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'

RSpec.describe Round do
  let(:card_1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }

  let(:cards) { [card_1, card_2, card_3] }

  let(:deck) { Deck.new(cards) }
  
  let(:round) { Round.new(deck) }

  it "round to hold deck" do
    expect(round.deck).to eq(deck) 
  end

  it "sets no turns as default" do
    expect(round.turns).to be_empty
  end
  
  it "returns the current card" do
    expect(round.current_card).to eq(card_1)
  end
  
  it "takes a turn with the current card" do
    expect(round.take_turn("Juneau").guess).to eq(Turn.new("Juneau", card_1).guess)
  end

  it "can evaluate correct guesses" do
    expect(round.take_turn("Juneau").correct?).to be(true)
  end
  
  it "collects spend turns" do
    round.take_turn("Juneau")
    
    expect(round.turns[0].card).to eq(card_1)
  end
  
  it "returns the total number of correct guesses" do
    round.take_turn("Juneau")
    round.take_turn("Venus")
    
    expect(round.number_correct).to eq(1)
  end
  
  it "returns the count of turns taken" do
    round.take_turn("Juneau")
    round.take_turn("Venus")
    
    expect(round.turns.count).to be(2)
  end
  
  it "returns the last feedback" do
    round.take_turn("Juneau")
    round.take_turn("Venus")
    
    expect(round.turns.last.feedback).to eq("Incorrect")  
  end
  
  it "can count the number of correct answers by category" do
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("Venus")
    
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end
  
  it "returns the percent of correct answers" do
    round.take_turn("Juneau")
    round.take_turn("Venus")
    
    expect(round.percent_correct).to eq(50.0)
  end
  
  it "returns the percent correct by category" do
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("Venus")

    expect(round.percent_correct_by_category(:STEM)).to eq(50.0)   
  end
  
  
end
