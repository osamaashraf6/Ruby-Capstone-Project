require 'date'

class Item
  attr_reader :publish_date, :archived, :id, :genre
  attr_accessor :author, :label

  def initialize(id, publish_date, author, archived: false)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @id = id || Random.rand(1..1000)
    @author = author
  end

  def genre=(genre)
    @genre = genre.name
    genre.items << self unless genre.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
