require_relative "deck"
include Hand

class Player
  def initialize(name: 'Player')
    @name=name  # name of player
    @hand=Hand.new # cards in hand
  end
end