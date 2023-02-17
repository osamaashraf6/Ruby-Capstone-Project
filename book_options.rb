require_relative './book'

class BookOptions
  attr_accessor :book_list

  def initialize
    @book_list = []
  end

  def add_book(label_options)
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state [good/bad]: '
    cover_state = gets.chomp

    new_book = Book.new(nil, publisher, publish_date, cover_state, nil)
    label_options.select_label.add_item(new_book)
    @book_list.push(new_book)
    puts 'Book Added!'
  end

  def list_of_books
    if @book_list.empty?
      puts 'No added books!'
      false
    else
      @book_list.each do |book|
        ## puts "[#{book.id}] - **LABEL** - **GENRE** - Author: #{book.author.first_name} #{book.author.last_name}"
        puts "[#{book.id}] - **LABEL** - **GENRE** - **AUTHOR**"
      end
    end
  end
end
