require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  let(:card_1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }

  let(:cards) { [card_1, card_2, card_3] }

  let(:deck) { Deck.new(cards) }

  it "deck contains cards" do
    expect(deck.cards).to eq(cards) 
  end

  it "counts the cards in deck" do
    expect(deck.count).to eq(3) 
  end

  it "filters cards by category" do
    expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
    expect(deck.cards_in_category(:Geography)).to eq([card_1])
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end
  
end
