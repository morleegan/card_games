require 'rspec'
require_relative '../lib/deck'
require_relative '../lib/card'

describe 'Card Behavior' do
  card = Card.new('Heart', '9')
  it 'creates a card' do
    card::suit.should === 'Heart'
    card::value.should === '9'
  end

  it 'card prints' do
    # TODO: Learn how to test output
    card.to_s # see output of to string
  end
end

describe 'Cards Behavior' do
  it 'should create an list of Cards' do
    cards = Cards.new
    cards::cards.length.should === 32
    cards::cards.should be_a(Card)
  end
end