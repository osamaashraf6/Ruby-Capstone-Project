require_relative './music'
require_relative './genre'
require_relative './genre_option'

class MusicOption
  attr_accessor :music_albums

  def initialize
    @music_albums = []
  end

  def add_a_music_album(genre_options)
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase == 'y'
    print 'Please enter the published date [Enter date in format (yyyy-mm-dd)] : '
    published_date = gets.chomp.to_s

    genre = genre_options.add_genre

    music_album = MusicAlbum.new(nil, on_spotify, published_date, genre, nil)

    @music_albums.push(music_album)

    genre_options.select_genre.add_item(music_album)

    puts "Album of genre '#{genre.name}' and publish date '#{published_date}' added successfully!"
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No album added!'
    else
      @music_albums.each_with_index do |album, index|
        print "[Album #{index + 1}]. Published date : #{album.publish_date}, Genre : #{album.genre.name}, "
        if album.on_spotify
          puts 'Available on spotify.'
        else
          puts 'Not available on spotify.'
        end
      end
    end
  end
end
