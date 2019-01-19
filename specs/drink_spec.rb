require("minitest/autorun")
require("minitest/rg")

require_relative("../Drink")

class TestDrink < MiniTest::Test

  def setup
    @beer = Drink.new("Punk IPA", 3, 2)
    @wine = Drink.new("Malbec", 4, 2)
    @cocktail = Drink.new("Margarita", 5, 2)
  end

end
