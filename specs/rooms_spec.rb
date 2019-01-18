require('minitest/autorun')
require('minitest/rg')
require("pry")
require_relative('../Rooms')
require_relative('../Songs')
require_relative('../Guests')


class TestRooms < Minitest::Test

  def setup
    song1 = Songs.new("Boom")
    song2 = Songs.new("Cry")
    song3 = Songs.new("Bye")
    @country_songs = [song1, song2, song3]
    song4 = Songs.new("Mate")
    song5 = Songs.new("Hate")
    song6 = Songs.new("Crate")
    @rap_songs = [song4, song5, song6]
    @room1 = Rooms.new("Country", 3, @country_songs, 5)
    @room2 = Rooms.new("Rap", 2, @rap_songs, 5)
    @guest1 = Guests.new("Bob", 25, "Mama Mia")
    @guest2 = Guests.new("Billy", 15, "Mate")
    @guest3 = Guests.new("Hilary", 20, "Bye")
    @guest4 = Guests.new("Bert", 12, "It's Christmas!")
  end

  def test_room_has_genre
    assert_equal("Country", @room1.genre)
  end

  def test_room_capacity
    assert_equal(3, @room1.capacity)
  end

  def test_room_has_songs
    assert_equal(@country_songs, @room1.songs)
  end

  def test_check_in_guest_to_room
    @room1.check_in(@guest1)
    assert_equal(3, @room1.capacity)
  end

  def test_check_out_guests_from_room
    @room2.check_out(@guest1)
    assert_equal(2, @room2.capacity)
  end

  def test_songs_can_be_added_to_room
    new_song = Songs.new("Buzz")
    @room1.add_songs(new_song)
    assert_equal(@country_songs, @room1.songs)
  end

  def test_if_capacity_full_add_guest_to_queue
    @room1.add_to_queue(@guest1)
    assert_equal(3, @room1.capacity)
  end

  def test_room_has_fee
    assert_equal(5, @room1.fee)
  end

  def test_guest_can_afford_fee__pays_fee
    @room1.pay_fee(@guest1, @room1)
    assert_equal(5, @room1.fee)
  end



end
