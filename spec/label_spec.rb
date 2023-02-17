require 'rspec'
require_relative '../label'
require_relative '../item'

describe Label do
  let(:id) { 1 }
  let(:title) { 'Test Title' }
  let(:color) { 'red' }

  subject { described_class.new(id, title, color) }

  describe '#initialize' do
    it 'sets the instance variables correctly' do
      expect(subject.id).to eq(id)
      expect(subject.title).to eq(title)
      expect(subject.color).to eq(color)
      expect(subject.instance_variable_get(:@items)).to eq([])
    end

    context 'when no id is provided' do
      it 'generates a random id between 1 and 1000' do
        label = described_class.new(nil, title, color)
        expect(label.id).to be_between(1, 1000)
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON string with the correct keys and values' do
      expected_json = {
        JSON.create_id => described_class.name,
        'id' => id,
        'title' => title,
        'color' => color
      }.to_json

      expect(subject.to_json).to eq(expected_json)
    end
  end

  describe '.json_create' do
    let(:json_string) do
      {
        JSON.create_id => described_class.name,
        'id' => id,
        'title' => title,
        'color' => color
      }.to_json
    end
  end

  describe '#add_item' do
    let(:item) { Item.new(1, '2022-01-01', 'Test Author') }

    it 'adds the item to the label' do
      subject.add_item(item)
      expect(subject.instance_variable_get(:@items)).to eq([item])
    end

    it 'sets the label attribute of the item' do
      subject.add_item(item)
      expect(item.label).to eq(subject)
    end

    context 'when the item has already been added to the label' do
      it 'does not add the item to the label again' do
        subject.add_item(item)
        subject.add_item(item)
        expect(subject.instance_variable_get(:@items)).to eq([item])
      end
    end
  end
end
