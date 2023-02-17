require 'io/console'
require_relative './author_options'
require_relative './game_options'
require_relative './file_storage'
require_relative './genre_option'
require_relative './music_option'
class MainMenu
  def initialize
    ### Create the method named in the value of the hash to ask for
    ### particular option parameters and instance external classes
    @options = { '1' => 'list_all_books', '2' => 'list_music_albums',
                 '3' => 'list_all_movies', '4' => 'list_of_games',
                 '5' => 'list_all_genres', '6' => 'list_all_labels',
                 '7' => 'list_all_authors', '8' => 'list_all_sources',
                 'B' => 'add_book', 'A' => 'add_music_album',
                 'M' => 'add_movie', 'G' => 'add_game', 'X' => 'exit_app' }

    @author_options = AuthorOptions.new
    @game_options = GameOptions.new
    @genre_options = GenreLister.new
    @music_options = MusicOption.new
    @author_options.author_list = FileStorage.load_data('author')
    @game_options.game_list = FileStorage.load_data('game')
    @genre_options.list_all_genres = FileStorage.load_data('genre')
    @music_options.music_albums = FileStorage.load_data('music')
  end

  def show_options
    # comment to test with RSPEC
    $stdout.clear_screen
    puts 'Welcome to Catalog of my things'
    puts
    @options.each do |key, value|
      puts "[#{key}] - #{value.gsub(/_/, ' ').capitalize!}"
    end
  end

  # def list_all_sources
  #   pp @author_options
  #   pp @game_options
  #   select_new_option
  # end

  def list_all_genres
    @genre_options.list_all_genres
    select_new_option
  end

  def list_music_albums
    @music_options.list_all_music_albums
    select_new_option
  end

  def list_of_games
    @game_options.list_of_games
    select_new_option
  end

  def list_all_authors
    @author_options.list_all_authors
    select_new_option
  end

  def add_music_album
    @music_options.add_a_music_album(@genre_options)
    select_new_option
  end

  def add_game
    @game_options.add_game(@author_options)
    select_new_option
  end

  def choose_valid_option
    loop do
      print 'Please choose an option by entering the number/letter: '
      @user_input = $stdin.gets.chomp.to_s.upcase
      break if @options.key?(@user_input)
    end
    @user_input
  end

  def exit_app
    puts 'Thank you for using the app!'
    FileStorage.save_data('genres', @genre_options.genres)
    FileStorage.save_data('music_albums', @music_options.music_albums)
    FileStorage.save_data('game', @game_options.game_list)
    FileStorage.save_data('author', @author_options.author_list)
    exit(0)
  end

  def select_new_option
    puts
    puts '*** Press any key to reload the main menu ***'
    $stdin.getc
    main_menu
  end

  def main_menu
    show_options
    valid_input = choose_valid_option
    exit_app if valid_input == 'X'
    send(@options[valid_input])
  end
end

# Uncomment to execute from command line - comment to test with rspec
a = MainMenu.new
a.main_menu
