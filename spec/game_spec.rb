require 'rspec'
require_relative '../game'

describe Game do
  before :each do
    @game1 = Game.new(true, '17/02/1990', '17/05/2019')
    @game2 = Game.new(true, '17/02/1990', '17/05/2022')
    @game3 = Game.new(true, '17/02/2015', '17/05/2019')
    @game4 = Game.new(true, '17/02/2015', '17/05/2022')
  end

  it 'takes three parameters and returns an Game object' do
    expect(@game1).to be_an_instance_of Game
  end

  it 'evaluate can_be_archived? with publish date > 10 and last_played_at > 2' do
    expect(@game1.can_be_archived?).to eql true
  end

  it 'evaluate can_be_archived? with publish date > 10 and last_played_at < 2' do
    expect(@game2.can_be_archived?).to eql false
  end

  it 'evaluate can_be_archived? with publish date < 10 and last_played_at > 2' do
    expect(@game3.can_be_archived?).to eql false
  end

  it 'evaluate can_be_archived? with publish date < 10 and last_played_at < 2' do
    expect(@game4.can_be_archived?).to eql false
  end
end
