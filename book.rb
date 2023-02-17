require_relative './item'

class Book < Item
  def initialize(id, publisher, publish_date, cover_state, author)
    super(id, publish_date, author)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super && @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['publisher'], object['publish_date'], object['cover_state'], object['author'])
  end
end

a = Book.new(nil, 'luis', '17/02/1976', 'bad', nil)
pp a.can_be_archived?
