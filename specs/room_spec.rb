require('minitest/autorun')
require('minitest/rg')
require("pry")
require_relative('../Room')
require_relative('../Song')
require_relative('../Guest')
require_relative('../Bar')
require_relative('../Food')
require_relative('../Drink')

class TestRoom < Minitest::Test

  def setup
    song1 = Song.new("Boom")
    song2 = Song.new("Cry")
    song3 = Song.new("Bye")
    @country_songs = [song1, song2, song3]
    song4 = Song.new("Mate")
    song5 = Song.new("Hate")
    song6 = Song.new("Crate")
    @rap_songs = [song4, song5, song6]
    @room1 = Room.new("Country", 3, @country_songs, 5, 0)
    @room2 = Room.new("Rap", 2, @rap_songs, 5, 0)
    @guest1 = Guest.new("Bob", 25, "Mama Mia")
    @guest2 = Guest.new("Billy", 50, "Mate")
    @guest3 = Guest.new("Hilary", 20, "Bye")
    @guest4 = Guest.new("Bert", 12, "It's Christmas!")
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
    assert_equal(1, @room1.guests.length)
  end

  def test_check_out_guests_from_room
    @room2.check_out(@guest2)
    assert_equal(0, @room2.guests.length)
  end

  def test_room_has_guests
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guests.length)
  end

  def test_songs_can_be_added_to_room
    new_song = Song.new("Buzz")
    @room1.add_songs(new_song)
    assert_equal(@country_songs, @room1.songs)
  end

  def test_if_capacity_full_add_guest_to_queue
    @room1.add_to_queue(@guest1)
    assert_equal(0, @room1.guests.length)
  end
##
  def test_if_capacity_full_add_guest_to_queue
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    @room1.add_to_queue(@guest4)
    assert_equal(3, @room1.guests.length)
  end
##
  def test_if_capacity_full_add_guest_to_queue
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    @room2.check_in(@guest3)
    @room2.add_to_queue(@guest4)
    assert_equal(3, @room2.guests.length)
  end

  def test_room_has_fee
    assert_equal(5, @room1.fee)
  end

  def test_add_fee_to_bar_tab
    @room1.add_fee_to_bar_tab(@guest1, @room1)
    assert_equal(5, @room1.fee)
    assert_equal(5, @room1.bar_tab)
    #assert_equal(20, @guest1.wallet)
  end

  def test_favorite_song_is_on_rooms_playlist
    @room2.favorite_song(@room2, @guest1)
    assert_equal("Mama Mia", @guest1.fave_song)
  end

  def test_favorite_song_is_on_rooms_playlist
    @room1.favorite_song(@room1, @guest1)
    assert_equal("Mama Mia", @guest1.fave_song)
  end

  def test_room_bar_tab_value
    @room1.add_fee_to_bar_tab(@guest1, @room1)
    assert_equal(5, @room1.bar_tab)
  end

  def test_add_guest_bar_purchases_to_room_bar_tab
    @room1.add_fee_to_bar_tab(@guest1, @room1)
    @room1.bar_purchase_to_room_tab(@room1, @beer)
    assert_equal(8, @room1.bar_tab)
  end

  def test_bar_tab_gets_paid_add_to_till__guest_has_enough_money
    @room1.add_fee_to_bar_tab(@guest2, @room1)
    @room1.bar_purchase_to_room_tab(@room1, @beer)
    @room1.bar_purchase_to_room_tab(@room1, @wine)
    @room1.bar_purchase_to_room_tab(@room1, @cocktail)
    @room1.bar_purchase_to_room_tab(@room1, @pizza)
    @room1.bar_purchase_to_room_tab(@room1, @burger)
    @room1.bar_tab_paid(@guest2, @room1_bar)
    assert_equal(0, @room1.bar_tab)
    assert_equal(22, @guest2.wallet)
    assert_equal(68, @room1_bar.till)
  end

  def test_bar_tab_gets_paid_add_to_till__not_enough_money
    @room1.add_fee_to_bar_tab(@guest1, @room1)
    @room1.bar_purchase_to_room_tab(@room1, @beer)
    @room1.bar_purchase_to_room_tab(@room1, @wine)
    @room1.bar_purchase_to_room_tab(@room1, @cocktail)
    @room1.bar_purchase_to_room_tab(@room1, @pizza)
    @room1.bar_purchase_to_room_tab(@room1, @burger)
    @room1.bar_tab_paid(@guest1, @room1_bar)
    assert_equal(0, @room1.bar_tab)
    assert_equal(0, @guest1.wallet)
    assert_equal(65, @room1_bar.till)
  end

  def test_customer_sings_while_washing_dishes
    assert_equal("#{@guest1.name} is washing dishes whilst singing #{@guest1.fave_song}", @room1.forfeit(@guest1))
  end
end
