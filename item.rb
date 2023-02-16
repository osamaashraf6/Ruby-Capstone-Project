require 'date'

class Item
  attr_reader :publish_date, :archived, :id, :label, :genre
  attr_accessor :author

  def initialize(id, publish_date, archived: false)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @id = id || Random.rand(1..1000)
  end

  def genre=(genre)
    @genre = genre.name
    genre.items << self unless genre.items.include?(self)
  end

  # This block brokes my code when we merge all PR the flow.
  # In this project the relation * is just in one direction and this behavior are implemented in author.add_item
  # def author=(author)
  #    @author = { first_name: author.first_name, last_name: author.last_name }
  #    author.items << self unless author.items.include?(self)
  #  end

  def label=(label)
    @label = label.name
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
