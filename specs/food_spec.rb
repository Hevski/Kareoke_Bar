require("minitest/autorun")
require("minitest/rg")

require_relative("../Food")

class TestFood < MiniTest::Test

  def setup
    @pizza = Food.new("Peperoni", 5)
    @chips = Food.new("chips n cheese", 3)
    @burger = Food.new("Aberdeen Angus", 6)
  end



end
