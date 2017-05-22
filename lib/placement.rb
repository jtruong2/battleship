require_relative 'player'
require_relative 'computer'
require 'pry'

class Placement
  attr_reader :player_ship1,
              :player_ship2,
              :player,
              :computer,
              :computer_ship1,
              :computer_ship2

  def initialize
    @player = Player.new
    @player_ship1 = player.ship1_coordinates
    @player_ship2 = player.ship2_coordinates
    @computer = Computer.new
    @computer_ship1 = computer.ship1_coordinates
    @computer_ship2 = computer.ship2_coordinates
  end

  def retrieve_all_ship_coordinates
    @computer.generate_coordinates_for_ship1
    @computer.generate_coordinates_for_ship2
    @player.assign_ship1_coordinates
    @player.assign_ship2_coordinates


  end


end
