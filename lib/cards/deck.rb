# Cards
class Card
  attr_reader :kind, :rank

  def initialize(kind, rank)
    @kind = kind
    @rank = rank
  end

  def to_s
    [@rank, @kind].join(' de ')
  end
end

# Deck of cards
class Deck
  attr_reader :cards
  # Palos
  KINDS = %w[Oro Bastos Copa Espada].freeze
  RANKS = [*1..7, 'Sota', 'Caballo', 'Rey'].freeze

  def initialize
    @cards = []

    KINDS.product(RANKS) do |kind, rank|
      @cards << Card.new(kind, rank)
    end
  end

  # Take cards from deck
  def take!(q = 1)
    @cards.shift(q)
  end

  # mix cards
  def shuffle!
    @cards.shuffle!
  end

  # partition deck
  def partition
    @cards.rotate!(@cards.count / 2)
  end

  # count of cards
  def count
    @cards.count
  end
end
