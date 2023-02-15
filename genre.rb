class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_to_items(item)
    raise ArgumentError, "Item does not have a 'genre' attribute" unless item.respond_to?(:genre=)

    @items << item
    item.genre = self
  end
end
