require_relative './item'

class Game < Item
  def initialize(multiplayer, publish_date, last_played_at)
    super(nil, publish_date)
    @last_played_at = Date.parse(last_played_at)
    @multiplayer = multiplayer
  end

  def greater_two_years?
    return true if ((Date.today - @last_played_at) / 365).floor > 2

    false
  end

  private :greater_two_years?

  def can_be_archived?
    super && greater_two_years?
  end
end
