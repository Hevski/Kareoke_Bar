require('minitest/autorun')
require('minitest/rg')
require_relative('../Bar')

class TestBar < Minitest::Test

  def setup
    @room1_bar = Bar.new("Country Bar", 40, @drinks, @food)
    @room2_bar = Bar.new("Rap Bar", 40, @drinks, @food)
    beer = Drink.new("Punk IPA", 3)
    wine = Drink.new("Malbec", 4)
    cocktail = Drink.new("Margarita", 5)
    @drinks = [beer, wine, cocktail]
    pizza = Food.new("Peperoni", 5)
    chips = Food.new("chips n cheese", 3)
    burger = Food.new("Aberdeen Angus", 6)
    @food = [pizza, chips, burger]
  end
end
