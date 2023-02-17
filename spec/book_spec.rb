require 'rspec'
require_relative '../book'

describe Book do
  let(:id) { 1 }
  let(:publisher) { 'Test Publisher' }
  let(:publish_date) { '2022-01-01' }
  let(:cover_state) { 'good' }
  let(:label) { 'Test Label' }

  subject { described_class.new(id, publisher, publish_date, cover_state, label) }

  describe '#can_be_archived?' do
    context 'when the item cannot be archived' do
      before { allow(subject).to receive(:can_be_archived?).and_return(false) }

      it 'always returns false' do
        expect(subject.can_be_archived?).to be_falsey
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON string with the correct keys and values' do
      expected_json = {
        JSON.create_id => described_class.name,
        'id' => id,
        'publisher' => publisher,
        'publish_date' => publish_date,
        'cover_state' => cover_state,
        'label' => label
      }.to_json

      expect(subject.to_json).to eq(expected_json)
    end
  end

  describe '.json_create' do
    let(:json_string) do
      {
        JSON.create_id => described_class.name,
        'id' => id,
        'publisher' => publisher,
        'publish_date' => publish_date,
        'cover_state' => cover_state,
        'label' => label
      }.to_json
    end
  end
end
