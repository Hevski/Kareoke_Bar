require('minitest/autorun')
require('minitest/rg')
require("pry")
require_relative('../Rooms')
require_relative('../Songs')
require_relative('../Guests')
require_relative('../Bar')
require_relative('../Food')
require_relative('../Drink')


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
    @room1 = Rooms.new("Country", 3, @country_songs, 5, 0)
    @room2 = Rooms.new("Rap", 2, @rap_songs, 5, 0)
    @guest1 = Guests.new("Bob", 25, "Mama Mia")
    @guest2 = Guests.new("Billy", 15, "Mate")
    @guest3 = Guests.new("Hilary", 20, "Bye")
    @guest4 = Guests.new("Bert", 12, "It's Christmas!")
    @beer = Drink.new("Punk IPA", 3)
    @wine = Drink.new("Malbec", 4)
    @cocktail = Drink.new("Margarita", 5)
    @drinks = [@beer, @wine, @cocktail]
    @pizza = Food.new("Peperoni", 5)
    @chips = Food.new("chips n cheese", 3)
    @burger = Food.new("Aberdeen Angus", 6)
    @food = [@pizza, @chips, @burger]
    @room1_bar = Bar.new("Country Bar", 40, @drinks, @food)
    @room2_bar = Bar.new("Rap Bar", 40, @drinks, @food)
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

  def test_count_guest_array
    assert_equal([], @room1.guests)
  end

  def test_check_in_guest_to_room
    @room1.check_in(@guest1)
    assert_equal(1, @room1.count_guests_in_room)
  end

  def test_check_out_guests_from_room
    @room2.check_out(@guest2)
    assert_equal(0, @room2.count_guests_in_room)
  end

  def test_room_has_guests
    @room1.check_in(@guest1)
    assert_equal(1, @room1.count_guests_in_room)
  end

  def test_songs_can_be_added_to_room
    new_song = Songs.new("Buzz")
    @room1.add_songs(new_song)
    assert_equal(@country_songs, @room1.songs)
  end

  def test_if_capacity_full_add_guest_to_queue
    @room1.add_to_queue(@guest1)
    assert_equal(0, @room1.count_guests_in_room)
  end

  def test_room_has_fee
    assert_equal(5, @room1.fee)
  end

  def test_guest_can_afford_fee__pays_fee
    @room1.pay_fee(@guest1, @room1)
    assert_equal(5, @room1.fee)
    assert_equal(20, @guest1.wallet)
  end

  def test_favorite_song_is_on_rooms_playlist
    @room2.favorite_song(@room2, @guest1)
    assert_equal("Mama Mia", @guest1.fave_song)
  end

  def test_room_bar_tab_value
    assert_equal(0, @room1.bar_tab)
  end

  def test_add_fee_to_bar_tab
    @room1.add_to_bar_tab(@room1)
    assert_equal(5, @room1.bar_tab)
  end

  def test_add_guest_bar_purchases_to_room_bar_tab
    @room1.bar_purchase_to_room_tab(@room1, @beer)
    assert_equal(3, @room1.bar_tab)
  end

  def test_bar_tab_is_less_than_guest_wallet__return_true
    assert_equal(true, @room1.can_afford_tab(@guest1))
  end

  #def test_customer_pays_bar_tab






end
