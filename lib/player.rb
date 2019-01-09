require_relative "deck"

class Player
  attr_accessor :name, :hand
  def initialize(name: 'Player')
    @name=name  # name of player
    @hand=Hand.new # cards in hand
  end
end