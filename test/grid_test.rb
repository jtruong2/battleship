require 'minitest/autorun'
require 'minitest/emoji'
require './lib/grid'

class GridTest < Minitest::Test

  def test_grid_rows_contains_array_of_coordinates
    grid = Grid.new

    assert_equal test_rows, grid.rows
  end

  def test_elements_in_rows_can_be_changed
    grid = Grid.new
    puts grid.rows[2][2]
    grid.rows[2][2] = "Hit"
    puts grid.rows[2][2]
    assert_equal "Hit", grid.rows[2][2]
  end

  def test_rows
    test_rows = [["", 1, 2, 3, 4],
  ["A", "A1", "A2", "A3", "A4"],
  ["B", "B1", "B2", "B3", "B4"],
  ["C", "C1", "C2", "C3", "C4"],
  ["D", "D1", "D2", "D3", "D4"]]
  end

end
