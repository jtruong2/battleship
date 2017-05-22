require 'pry'
require_relative 'placement'

class Battleship
  attr_reader :start_game,
              :placement

  def initialize
    @placement = Placement.new
  end


  def intro
    puts 'Welcome to BATTLESHIP'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit'
    response = gets.chomp.downcase
    if response == 'p'
      self.start_game
    elsif response == 'i'
      instructions = File.read("/Users/jimmytruong/turing/1module/projects/battleship/instructions/instructions.md")
      puts instructions
    elsif response == 'q'
      puts 'Goodbye!'
    else
      puts "Invalid response!"
    end
  end

  def start_game
    @placement.retrieve_all_ship_coordinates


  end



end



battleship = Battleship.new
battleship
