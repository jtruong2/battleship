require 'terminal-table'
require 'pry'

class Grid
  attr_accessor :rows_player,
                :rows_computer

  def initialize
    @rows_player =[
    ["A", "A1", "A2", "A3", "A4"],
    ["B", "B1", "B2", "B3", "B4"],
    ["C", "C1", "C2", "C3", "C4"],
    ["D", "D1", "D2", "D3", "D4"]]

    @rows_computer =[
    ["A", "A1", "A2", "A3", "A4"],
    ["B", "B1", "B2", "B3", "B4"],
    ["C", "C1", "C2", "C3", "C4"],
    ["D", "D1", "D2", "D3", "D4"]]
  end

  def player_table
    player_table = Terminal::Table.new :title => "BATTLESHIP: PLAYER MAP", :headings => ['','1', '2', '3', '4'], :rows => rows_player, :style => {:width => 50, :padding_left => 4}

  end

  def computer_table
    computer_table = Terminal::Table.new :title => "BATTLESHIP: COMPUTER MAP", :headings => ['','1', '2', '3', '4'], :rows => rows_computer, :style => {:width => 50, :padding_left => 4}
  end

  def player_grid(coordinate, h_or_m)
    rows_player.each do |sub_array|
      sub_array.map! do |pos|
        if pos == coordinate
          pos = h_or_m
        else
          pos = pos
        end
      end
    end
    puts player_table
  end

  def computer_grid(coordinate, h_or_m)
    rows_computer.each do |sub_array|
      sub_array.map! do |pos|
        if pos == coordinate
          pos = h_or_m
        else
          pos = pos
        end
      end
    end
    puts self.computer_table
  end
end
