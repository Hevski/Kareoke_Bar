require('minitest/autorun')
require('minitest/rg')
require_relative('../Bar')

class TestBar < Minitest::Test

  def setup
    @guest1_tab = Bar.new(0)
  end


end
