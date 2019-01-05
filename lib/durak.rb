require "durak/version"
require_relative "deck"

module Durak
  def create_players(num_of_players: 4)
    if num_of_players > 6 || num_of_players < 2
      return puts 'Number of players is invalid. Please input a number between 2 and 6'
    end
    players = []
    i = 1
    loop do
      # set up players
      break if i >= num_of_players
      name = 'Player ' + i.to_s
      players = players + Player(name)
      i += 1
    end
    players
  end

  def play(num_of_players: 4)
    players = self.create_players(num_of_players: num_of_players)
    return if players.length === 0
    deck = Deck.new
    deck.deal(players, 6)
  end
end