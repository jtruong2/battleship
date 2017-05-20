require 'minitest/autorun'
require 'minitest/emoji'
require './lib/shoot'

class ShootTest < Minitest::Test
  def test_accepts_coordinates_to_shoot_from_player
    shoot = Shoot.new
    puts 'test_accepts_coordinates_to_shoot_from_player'
    x = shoot.player.fire_missile
    assert_equal x, shoot.player_fire
  end

  def test_accepts_coordinates_to_shoot_from_computer
    shoot = Shoot.new
    puts 'test_accepts_coordinates_to_shoot_from_computer'
    x = shoot.computer.fire_missile
    assert_equal x , shoot.computer_fire
  end
end
