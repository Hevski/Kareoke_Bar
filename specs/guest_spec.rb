require('minitest/autorun')
require('minitest/rg')
require_relative('../Guest')

class TestGuests < Minitest::Test

  def setup
    @guest = Guest.new("Bob", 25, "Mama Mia")
  end

  def test_guest_has_name
    assert_equal("Bob", @guest.name)
  end

  def test_guest_has_money_in_wallet
    assert_equal(25, @guest.wallet)
  end

  def test_guest_fave_song
    assert_equal("Mama Mia", @guest.fave_song)
  end
end
