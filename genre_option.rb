require_relative './genre'

class GenreLister
  def initialize(genres)
    @genres = genres
  end

  def list_all_genres
    if @genres.empty?
      puts "\nNo genres added. Please add some genres."
    else
      puts "\nExisting genres in the list:"
      @genres.each do |genre|
        puts "#{genre.id}. #{genre.name}"
      end
    end
  end

  def select_genre
    list_all_genres
    print "\nPlease select a genre by typing the right number: "

    genre_input = gets.chomp.to_i
    raise ArgumentError, 'Invalid genre input' unless (1..@genres.length).include?(genre_input)

    @genres[genre_input - 1]
  end
end

class GenreCreator
  def initialize(genres)
    @genres = genres
  end

  def create_genre
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    puts "#{genre.name} genre has been added."
    genre
  end
end

class GenreOption
  def initialize(genres)
    @genres = genres
    @genre_lister = GenreLister.new(@genres)
    @genre_creator = GenreCreator.new(@genres)
  end

  def add_genre
    if @genres.empty?
      puts 'No genres available. Adding a new genre.'
      @genre_creator.create_genre
    else
      puts "\nSelect a genre for this item or add a new one:"
      puts '[1] Select from existing genres'
      puts '[2] Add a new genre'

      input = gets.chomp.to_i

      case input
      when 1
        @genre_lister.select_genre
      when 2
        @genre_creator.create_genre
      else
        raise ArgumentError, 'Invalid input. Please enter 1 or 2.'
      end
    end
  end
end
