require 'pry'
require_relative 'placement'
require_relative 'shoot'

class Battleship
  attr_reader :start_game,
              :placement

  def initialize
    @placement = Placement.new
    @shoot = Shoot.new
  end


  def intro
    puts 'Welcome to BATTLESHIP'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit'
    response = gets.chomp.downcase
    if response == 'p'
      self.ship_layout
    elsif response == 'i'
      instructions = File.read("/Users/jimmytruong/turing/1module/projects/battleship/instructions/instructions.md")
      puts instructions
    elsif response == 'q'
      puts 'Goodbye!'
    else
      puts "Invalid response!"
    end
  end

  def ship_layout
    @placement.retrieve_all_ship_coordinates
    self.fire_shot
  end

  def fire_shot
    player_ship1_count = 0
    player_ship2_count = 0
    computer_ship1_count = 0
    computer_ship2_count = 0

    until (player_ship1_count == 2 && player_ship2_count == 3) || (computer_ship1_count == 2 && computer_ship2_count == 3) do
      @shoot.player_fire
      if @placement.computer_ship1.include?(@shoot.player.current_shot)
        puts "Hit,computer ship 1"
        #update grid
        computer_ship1_count += 1
        if computer_ship1_count == 2
          puts "You sank computers small ship"
        end
      elsif @placement.computer_ship2.include?(@shoot.player.current_shot)
        puts "Hit, computer ship 2!"
        #update grid
        computer_ship2_count += 1
        if computer_ship2_count == 3
          puts "You sank computers big ship"
        end
      else
        puts "Miss, computer ships"
        #update grid
      end
      @shoot.computer.fire_missile
      if @placement.player_ship1.include?(@shoot.computer.current_shot)
        puts "Hit, player ship 1"
        #update grid
        player_ship1_count += 1
        if player_ship1_count == 2
          puts "Computer sank your small ship"
        end
      elsif @placement.player_ship2.include?(@shoot.computer.current_shot)
        puts "Hit, player ship 2"
        #update grid
        player_ship2_count += 1
        if player_ship2_count == 3
          puts "Computer sank your big ship"
        end
      else
        puts "Miss, player ships"
        #update grid
      end
    end
  end
end


battleship = Battleship.new
battleship.intro.pry
