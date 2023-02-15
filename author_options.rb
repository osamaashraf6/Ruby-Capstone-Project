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

  def create_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    @author_list.push(Author.new(nil, first_name, last_name))
    puts 'Author Added!'
  end

  def count_id(value)
    result = @author_list.find_all { |author| author.id == value.to_i }
    result.length
  end

  def select_author
    return unless list_all_authors

    loop do
      print 'Select an author ID from the previous list by number or [C] to create a new: '
      @user_input = $stdin.gets.chomp.upcase
      break if @user_input == 'C' || count_id(@user_input).positive?
    end
    @user_input
  end
end
