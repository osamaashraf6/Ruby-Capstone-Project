require 'io/console'
require_relative './author_options'

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

  def list_all_authors
    @author_options.list_all_authors
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
    exit(0)
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
