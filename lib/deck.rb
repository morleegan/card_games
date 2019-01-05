require_relative "card"

class Cards
  # Ordered cards created as a suit and value pair.
  attr_accessor :suits
  attr_accessor :values
  attr_accessor :cards

  def initialize(card_suits: nil, card_values: nil)
    @suits = card_suits.nil? ? %w[
      Heart Spade Diamond Club
    ] : card_suits
    @values = card_values.nil? ? %w[
      K Q J 10 9 8 7 6
    ] : card_values
    @cards = @suits.map { |suit| @values.map { |value| Card.new(suit, value) } }
    @cards.flatten!
  end

  def shuffle
    @cards.shuffle!
  end

  def show_all_cards
    @cards.each { |card| puts card.kind_of }
  end
end

class Deck < Cards
  # Unordered Cards taken from the Card Ordered class.
  def initialize
    super
    self.shuffle
  end

  def take(num_of_cards)
    @cards.slice!(0, num_of_cards)
  end

  def deal(all_players, cards_dealt)
    i = 0
    while i < cards_dealt
      all_players.each { |player| player.hand.take(self.draw) }
      i += 1
    end
  end
end

class Hand < Cards
  # Player held cards, known as a hand
  def initialize
    @cards = []
  end

  def get_cards
    @cards
  end

  def get_num_of_cards
    @cards.length
  end

  def draw(new_cards)
    # card modifier
    @cards = @cards + new_cards
  end

  def play(val)
    @cards.slice!(val)
  end

  def play_multiple(vals)
    # TODO: used in other games. Not applicable to Durak
    raise NotImplementedError 'used in other games. Not applicable to Durak'
  end

  def rearrange(card1, card2)
    # TODO: when front end exists it may make sense to order hand or be able to arrange hand.
    raise NotImplementedError 'future feature'
  end
end