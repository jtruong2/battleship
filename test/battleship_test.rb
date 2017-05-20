require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require 'pry'

class BattleShipTest < Minitest::Test
  def test_type_of_class
    battleship = BattleShip.new
    assert_instance_of BattleShip, battleship
  end
end
