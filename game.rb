require_relative './item'

class Game < Item
  def initialize(id, multiplayer, publish_date, last_played_at, author)
    super(id, publish_date, author)
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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'multiplayer' => @multiplayer,
      'publish_date' => @publish_date,
      'last_played_at' => @last_played_at,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['multiplayer'], object['publish_date'], object['last_played_at'], object['author'])
  end
end
