class Card
  attr_accessor :suit, :value

  def initialize(suit, val)
    @suit = suit
    @value = val
  end

  def kind_of
    @value + ' of ' + @suit + 's'
  end
end