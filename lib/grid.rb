require 'terminal-table'
require 'pry'

class Grid
  attr_accessor :rows

  def initialize
    @rows = [["", 1, 2, 3, 4],
    ["A", "A1", "A2", "A3", "A4"],
    ["B", "B1", "B2", "B3", "B4"],
    ["C", "C1", "C2", "C3", "C4"],
    ["D", "D1", "D2", "D3", "D4"]]

    # @table = Terminal::Table.new :title => "BATTLESHIP", :rows => rows, :style => {:width => 30}
  end

  def table
    table = Terminal::Table.new :title => "BATTLESHIP", :rows => rows, :style => {:width => 30}
  end

end
