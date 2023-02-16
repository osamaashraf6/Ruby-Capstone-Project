require_relative './music'
require_relative './genre'
require_relative './genre_option'

class MusicModule
  include GenreLister

  def initialize(music_albums)
    @music_albums = music_albums
  end

  def add_a_music_album
    on_spotify = prompt_spotify_status
    published_date = prompt_published_date

    music_album = MusicAlbum.new(on_spotify, published_date)
    @music_albums << music_album

    genre = add_genre
    genre.add_item(music_album)

    puts "Album of '#{genre.name}' genre added successfully!"
  end

  def prompt_spotify_status
    print 'Is it on Spotify? [Y/N]: '
    gets.chomp.upcase == 'Y'
  end

  def prompt_published_date
    print 'Please enter the published date: '
    gets.chomp
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No albums added!'
    else
      @music_albums.each do |album|
        spotify_status = album.on_spotify ? 'Available on Spotify' : 'Not available on Spotify'
        puts "#{album.id}. Published date: #{album.publish_date}. #{spotify_status}."
      end
    end
  end
end
