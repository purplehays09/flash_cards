require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    deck.cards.shift
    turns << turn
    turn
  end

  def number_correct
    count = 0

    turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    count = 0
    
    turns.each do |turn|
      if turn.correct? && turn.card.category == category
        count += 1
      end
    end
    count
  end

  def percent_correct
    number_correct.to_f / turns.count.to_f * 100
  end
  
  def percent_correct_by_category(category)
    correct = number_correct_by_category(category).to_f
    count = 0.0
    turns.each do |turn|
      if turn.card.category == category    
        count += 1.0
      end
    end
    correct / count * 100
  end
end