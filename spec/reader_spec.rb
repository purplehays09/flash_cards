file = File.open("../file_hub/flashcards.txt")
require './lib/card'

RSpec.describe do
  let(:cards) {
    file.readlines.map do |line|
      card_info = line.split(", ")
      Card.new(
        card_info[0], 
        card_info[1], 
        card_info[2].strip.to_sym
      )
    end
  }

  it "can read cards" do
    expect(cards[0].answer).to eq("Juneau")
    expect(cards[1].answer).to eq("Mars")
    expect(cards[2].category).to eq(:STEM)
  end
  
end
