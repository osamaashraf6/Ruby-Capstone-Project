require 'rspec'
require_relative '../genre'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with a default id if one is not provided' do
      genre = Genre.new(nil, 'test genre')
      expect(genre.id).to be_between(1, 1000)
      expect(genre.name).to eq('test genre')
      expect(genre.items).to be_empty
    end

    it 'creates a new genre with the provided id and name' do
      genre = Genre.new(123, 'test genre')
      expect(genre.id).to eq(123)
      expect(genre.name).to eq('test genre')
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it "adds a new item to the genre's items array and sets the item's genre attribute to the current genre" do
      genre = Genre.new(123, 'test genre')
      item = double('Item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.items).to eq([item])
    end
  end

  describe '#to_json' do
    it 'returns a JSON string representing the genre' do
      genre = Genre.new(123, 'test genre')
      expected_json = '{"json_class":"Genre","id":123,"name":"test genre"}'
      expect(genre.to_json).to eq(expected_json)
    end
  end

  describe '.json_create' do
    it 'returns a new genre object with the provided id and name' do
      json = '{"json_class":"Genre","id":123,"name":"test genre"}'
      genre = Genre.json_create(JSON.parse(json))
      expect(genre.id).to eq(123)
      expect(genre.name).to eq('test genre')
      expect(genre.items).to be_empty
    end
  end
end
