require_relative './label'

class LabelOptions
  attr_accessor :label_list

  def initialize
    @label_list = []
  end

  def list_all_labels
    if @label_list.empty?
      puts 'No added labels!'
      false
    else
      @label_list.each do |label|
        puts "[#{label.id}] - #{label.title} #{label.color}"
      end
    end
  end

  def add_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    new_label = Label.new(nil, title, color)
    @label_list.push(new_label)
    puts 'Label Added!'
    new_label
  end

  def select_label_with_id(value)
    @label_list.find_all { |label| label.id == value.to_i }
  end

  def select_label()
    list_all_labels

    loop do
      print 'Select a label ID from the previous list by number or [C] to create a new: '
      @user_input = $stdin.gets.chomp.upcase
      break if @user_input == 'C' || select_label_with_id(@user_input).length.positive?
    end

    return add_label if @user_input == 'C'

    select_label_with_id(@user_input)[0]
  end
end
