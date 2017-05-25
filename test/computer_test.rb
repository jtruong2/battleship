require 'minitest/autorun'
require 'minitest/emoji'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_generate_random_coordinates_for_ship1
    computer = Computer.new
    position = computer.generate_coordinates_for_ship1

    assert_equal position, computer.ship1_coordinates
  end

  def test_generate_random_coordinates_for_ship2
    computer = Computer.new
    position = computer.generate_coordinates_for_ship2

    assert_equal position, computer.ship2_coordinates
  end

  def test_generate_random_coordinates_to_fire
    computer = Computer.new
    position = computer.fire_missile
    
    assert_equal position, computer.current_shot
  end
end
