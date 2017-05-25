require_relative 'test_helper'
require 'minitest/emoji'
require './lib/grid'

class GridTest < Minitest::Test

  def test_grid_rows_contains_array_of_coordinates
    grid = Grid.new

    assert_instance_of Array, grid.rows_player
  end

  def test_elements_in_rows_can_be_changed
    grid = Grid.new
    grid.rows_player[2][2] = "Hit"

    assert_equal "Hit", grid.rows_player[2][2]
  end


end
