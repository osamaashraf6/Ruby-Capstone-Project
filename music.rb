require_relative './item'
require_relative './genre'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :genre

  def initialize(on_spotify, publish_date, genre)
    super(publish_date)
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify == true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'genre' => @genre
    }.to_json(*args)
  end

  def self.json_create(object)
    music_album = new(object['on_spotify'], object['publish_date'], object['genre'])
    genre = JSON.parse(JSON.generate(object['genre']), create_additions: true)
    genre.add_item(music_album)
    music_album
  end
end
