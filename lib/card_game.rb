require_relative "deck"
require_relative "player"

class CardGame
  attr_accessor :deck, :players, :num_players

  def initialize(num_of_players)
    @num_players = num_of_players
    @players = []
    @deck = Deck.new
  end

  def create_players(num_of_players: 4)
    if num_of_players <= 1
      return puts 'You need more than one person to play'
    end
    players, i = [], 0
    while i < num_of_players
      name = 'Player ' + i.to_s
      players = players + Player(name)
      i += 1
    end
    players
  end
end

class Durak < CardGame
  def initialize(num_of_players)
    super(num_of_players)
    @trump = '' # suit value that is higher than the others
  end

  def assign_trump
    trump_drawn = @deck.add(1)
    @trump = trump_drawn::suit
    @deck.push(trump_drawn)
  end

  def player_wins(player)
    if player::hand.get_num_of_cards === 0
      puts player::name ' wins!'
      true
    else
      false
    end
  end

  def valid_select(selected, on_table)
    # create a hash map of values on table for faster check of whether selected is valid
    if on_table.length > 0
      on_table.each { |c| c.value === selected.value ? return true : continue}
      false
    end
    true
  end

  def attack(att_card, def_card)
    if att_card.suit != def_card.suit && def_card.suit != @trump
      puts 'Defense Fails'
      return false
    end
    if @trump === def_card.suit
      if def_card.value < att_card.value && att_card.suit === @trump
        puts 'Defense Fails'
        return false
      end
    end
    if att_card.value > def_card
      puts 'Defense Fails'
      return false
    end
    puts 'Defense Succeeds'
    true
  end

  def round(val_defender)
    on_table = [] # in the attack defend game, all cards go into hand of defender if lost
    puts @players[val_defender-1]::name 'play attack card.'
    att_card = @players[val_defender-1]::hand.select
    puts @players[val_defender]::name 'play defense card.'
    def_card = @players[val_defender]::hand.select
    on_table.push([att_card, def_card])
    attack(att_card, def_card) ? round(val_defender) : @players[val_defender].add
  end

  def play
    @players = CardGame.create_players(num_of_players: @num_players)
    return if @players.length <= 1
    @deck.deal(@players, 6)
    self.assign_trump

    while @deck.get_num_of_cards !=0 && @players.length > 1
      self.round(1)
    end
  end
end

durak = Durak.new(ARGV.shift)
player = Player.new
player.hand = Deck.new
durak.select_from_hand(player)