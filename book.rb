require_relative './item'

class Book < Item
  def initialize(id, publisher, publish_date, cover_state, label)
    super(id, publish_date, author)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
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
      'label' => @label
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['publisher'], object['publish_date'], object['cover_state'], object['label'])
  end
end
