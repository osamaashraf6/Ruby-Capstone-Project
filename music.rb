require_relative './item'
require_relative './genre'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :genre

  def initialize(_id, on_spotify, publish_date, genre, author)
    super(nil, publish_date, author)
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify == true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'genre' => @genre,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['on_spotify'], object['publish_date'], object['genre'], object['author'])
  end
end
