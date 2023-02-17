require 'rspec'
require_relative '../music'
require_relative '../item'
require_relative '../genre'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    it 'returns false if the music album cannot be archived' do
      genre = Genre.new(123, 'test genre')
      author = 'test author'
      music_album = MusicAlbum.new(456, false, '2021-01-01', genre, author)
      expect(music_album.can_be_archived?).to be false
    end
  end
end
