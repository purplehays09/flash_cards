require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'takes in string (guess) and card object' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn.guess).to eq("Juneau")  
    expect(turn.card).to eq(card)
  end
  
  it "checks to see if the guess is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be(true) 
  end
  
  it "return 'Correct' if true" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  
    expect(turn.feedback).to eq("Correct") 
    
  end
  
  it "returns 'Incorrect' if false" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Jeneau", card)
  
    expect(turn.feedback).to eq("Incorrect") 
    
  end
end