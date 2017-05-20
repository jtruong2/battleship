require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_can_take_user_input_for_ship1_coordinates
    player = Player.new
    puts "Enter coordinates B1 and B2 to test 2 unit ship"
    assert_equal ['B1','B2'], player.assign_ship1_coordinates
  end

  def test_can_take_user_input_for_ship2_coordinates
    player = Player.new
    puts "Enter coordinates A1 and C1 to test 3 unit ship"
    assert_equal ['A1', 'C1'], player.assign_ship2_coordinates
  end

  def test_can_take_user_input_coordinates_to_fire
    player = Player.new
    puts "Enter coordinates D4 to test fire missle"
    assert_equal "D4", player.fire_missile
  end

  def test_count_how_many_times_fired_missle
    player = Player.new
    puts "Enter coordinates 3 times to test count"
    player.fire_missile
    player.fire_missile
    player.fire_missile
    assert_equal 3, player.times_fired
  end

  # def test_reset_ship1_coordinates_if_not_valid_selection
  #   player = Player.new
  #   puts "Enter coordinates B1 and B2 to test reset ship 1"
  #   player.assign_ship1_coordinates
  #   player.ship1_coordinates
  #   player.reset_ship1_coordinates
  #   assert_equal [], player.ship1_coordinates
  # end
  #
  # def test_reset_ship2_coordinates_if_not_valid_selection
  #   player = Player.new
  #   puts "Enter coordinates A1 and C1 to test reset ship 2"
  #   player.assign_ship2_coordinates
  #   player.ship2_coordinates
  #   player.reset_ship2_coordinates
  #   assert_equal [], player.ship2_coordinates
  # end

end
