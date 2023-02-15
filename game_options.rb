require_relative './game'

class GameOptions
  def initialize
    @game_list = []
  end

  def add_game(author_options)
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    print 'Multiplayer [true/false]: '
    multiplayer = gets.chomp

    new_game = Game.new(multiplayer, publish_date, last_played_at)
    author_options.select_author.add_item(new_game)
    @game_list.push(new_game)
    puts 'Game Added!'
  end

  def list_of_games
    if @game_list.empty?
      puts 'No added games!'
      false
    else
      @game_list.each do |game|
        puts "[#{game.id}] - **LABEL** - **GENRE** - Author: #{game.author.first_name} #{game.author.last_name}"
      end
    end
  end
end
