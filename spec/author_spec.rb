require 'rspec'
require_relative '../item'
require_relative '../author'

describe Author do
  before :each do
    @author = Author.new(nil, 'Luis', 'Munoz')
    @item = Item.new(nil, '17/02/2023', archived: true)
  end

  it 'takes three parameters and returns an Author object' do
    expect(@author).to be_an_instance_of Author
  end

  it 'Add item should add object into items array be of length 1' do
    @author.add_item(@item)
    expect(@author.items.length).to eql 1
  end

  it 'Add duplicated item should add just one object into items array be of length 1' do
    @author.add_item(@item)
    @author.add_item(@item)
    expect(@author.items.length).to eql 1
  end
end
