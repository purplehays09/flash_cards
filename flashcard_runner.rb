require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'

file = File.open("../file_hub/flashcards.txt")

# card_1 = Card.new(
#     "What is the capital of Alaska?", 
#     "Juneau", 
#     :Geography) 
# card_2 = Card.new(
#     "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", 
#     "Mars", 
#     :STEM) 
# card_3 = Card.new(
#     "Describe in words the exact direction that is 697.5° clockwise from due north?", 
#     "North north west", 
#     :STEM) 

# cards =  [card_1, card_2, card_3] 

cards = file.readlines.map do |line|
  card_info = line.split(", ")
  Card.new(card_info[0], card_info[1], card_info[2].strip.to_sym)
  
end

deck =  Deck.new(cards) 

round =  Round.new(deck) 



puts "Welcome! You're playing with 4 cards.\n"
print "-" * 40 + "\n"

cards.length.times  do |round_num|
  puts "This is card #{round_num + 1} of #{round.deck.cards.length + round.turns.length}"
  puts "Category: #{round.deck.cards[0].category}"
  puts "Question: #{round.deck.cards[0].question}"
  guess = gets.strip
  turn = round.take_turn(guess)
  puts turn.card.answer
  puts turn.feedback
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct.to_i}%"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"

puts "\n\n"