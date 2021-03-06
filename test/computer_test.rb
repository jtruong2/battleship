require_relative 'test_helper'
require 'minitest/emoji'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_generate_random_coordinates_for_ship1
    computer = Computer.new
    position = computer.generate_ship1

    assert_equal position, computer.ship1
  end

  def test_generate_random_coordinates_for_ship2
    computer = Computer.new
    position = computer.generate_ship2

    assert_equal position, computer.ship2
  end

  def test_generate_random_coordinates_to_fire
    computer = Computer.new
    position = computer.fire_missile

    assert_equal position, computer.current_shot
  end
end
