require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_can_take_user_input_for_ship1_coordinates
    player = Player.new
    puts "Enter coordinates B1 and B2 to test"
    player.find_ship1_coordinate1
    player.find_ship1_coordinate2

    assert_equal ['B1', 'B2'], player.ship1
  end

  def test_can_take_user_input_for_ship2_coordinates
    player = Player.new
    puts "Enter coordinates A1 and C1 to test 3 unit ship"
    player.find_ship2_coordinate1
    player.find_ship2_coordinate2

    assert_equal ['A1', 'C1'], player.ship2
  end

  def test_can_take_user_input_coordinates_to_fire
    player = Player.new
    puts "Enter coordinates D4 to test fire missle"
    player.fire_missile
    assert_equal ["D4"], player.fire
  end

  def test_count_how_many_times_fired_and_list_of_coordinates_fired
    player = Player.new
    puts "Enter coordinates A1, A2, A3 to test count"
    player.fire_missile
    player.fire_missile
    player.fire_missile

    assert_equal 3, player.fire.length
    assert_equal ['A1', 'A2', 'A3'], player.fire
  end
end
