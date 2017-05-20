require 'minitest/autorun'
require 'minitest/emoji'
require './lib/placement'

class PlacementTest < Minitest::Test
  def test_accepts_coordinates_from_player_for_ship1
    skip
    placement = Placement.new
    puts 'test_accepts_coordinates_from_player_for_ship1'
    x = placement.player.assign_ship1_coordinates
    assert_equal x, placement.player_ship1
  end

  def test_accepts_or_rejects_coordinates_from_player_for_ship2
    skip
    placement = Placement.new
    puts 'test_accepts_or_rejects_coordinates_from_player_for_ship2'
    placement.player.assign_ship1_coordinates
    x = placement.player.assign_ship2_coordinates
    assert_equal x, placement.player_ship2
  end

  def test_accepts_coordinates_from_computer_for_ship1
    placement = Placement.new
    puts 'test_accepts_coordinates_from_computer_for_ship1'
    x = placement.computer.generate_coordinates_for_ship1
    assert_equal x, placement.computer_ship1
  end

  def test_accepts_coordinates_from_computer_for_ship2
    placement = Placement.new
    puts 'test_accepts_coordinates_from_computer_for_ship2'
    x = placement.computer.generate_coordinates_for_ship2
    assert_equal x, placement.computer_ship2
  end


end
