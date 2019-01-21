require('minitest/autorun')
require('minitest/rg')
require_relative('../Song')

class TestSong < Minitest::Test

  def setup
    @song = Song.new("song title")
  end

  def test_song_has_title
    assert_equal("song title", @song.title)
  end
end
