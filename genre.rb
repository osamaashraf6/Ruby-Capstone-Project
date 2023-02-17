class Genre
  attr_accessor :id, :name, :items

  ## 4
  ## def initialize(name)
  def initialize(id, name)
    ## 5
    ## @id = Random.rand(1..1000)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['name'])
  end
end
