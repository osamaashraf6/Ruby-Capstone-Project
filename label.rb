require_relative './item'

class Label
  attr_reader :id, :title, :color

  def initialize(id, title, color)
    @id = id || Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['title'], object['color'])
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.label = self
  end
end
