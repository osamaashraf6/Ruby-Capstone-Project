require_relative './item'

class Author
  attr_reader :items, :id, :first_name, :last_name
  attr_accessor :author

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['first_name'], object['last_name'])
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end
