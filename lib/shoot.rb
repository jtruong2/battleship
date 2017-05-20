require 'pry'
require_relative 'player'
require_relative 'computer'

class Shoot
  attr_reader :player,
              :player_fire,
              :computer,
              :computer_fire

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def player_fire
    player_fire = player.fire
  end

  def computer_fire
    computer_fire = computer.fire
  end
end
