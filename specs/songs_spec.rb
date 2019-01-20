require('minitest/autorun')
require('minitest/rg')
require_relative('../Songs')

class TestSongs < Minitest::Test

  def setup
    @song = Songs.new("song title")
  end

  def test_song_has_title
    assert_equal("song title", @song.title)
  end
end
