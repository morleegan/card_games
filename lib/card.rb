class Card
  def initialize(suit, val)
    @suit = suit
    @value = val
  end

  def kind_of
    @value + ' of ' + @suit + 's'
  end
end

# card = Card.new('Heart', '9')
# card.to_s