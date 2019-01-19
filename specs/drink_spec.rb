require("minitest/autorun")
require("minitest/rg")

require_relative("../Drink")

class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new("Punk IPA", 3, 2)
  end

end
