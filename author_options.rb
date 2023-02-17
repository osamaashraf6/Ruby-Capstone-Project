require_relative './author'

class AuthorOptions
  attr_accessor :author_list

  def initialize
    @author_list = []
  end

  def list_all_authors
    if @author_list.empty?
      puts 'No added authors!'
      false
    else
      @author_list.each do |author|
        puts "[#{author.id}] - #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    new_author = Author.new(nil, first_name, last_name)
    @author_list.push(new_author)
    puts 'Author Added!'
    new_author
  end

  def select_author_with_id(value)
    @author_list.find_all { |author| author.id == value.to_i }
  end

  def select_author()
    list_all_authors

    loop do
      print 'Select an author ID from the previous list by number or [C] to create a new: '
      @user_input = $stdin.gets.chomp.upcase
      break if @user_input == 'C' || select_author_with_id(@user_input).length.positive?
    end

    return add_author if @user_input == 'C'

    select_author_with_id(@user_input)[0]
  end
end
