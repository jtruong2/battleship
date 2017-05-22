require 'pry'
require_relative 'placement'
require_relative 'grid'

class Battleship
  attr_reader :placement


  def initialize
    @placement = Placement.new
    @grid = Grid.new
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
    start = Time.now
    player_ship1_count = 0
    player_ship2_count = 0
    computer_ship1_count = 0
    computer_ship2_count = 0

    until (player_ship1_count == 2 && player_ship2_count == 3) || (computer_ship1_count == 2 && computer_ship2_count == 3) do
      clown = "\u{1F921}"
      cowboy = "\u{1F920}"
      miss = "\u{1F4A9}"
      @placement.player.fire_missile
      if @placement.computer_ship1.include?(@placement.player.current_shot)
        puts "Hit,computer ship 1"
          @grid.player_grid(@placement.player.current_shot, cowboy)
        computer_ship1_count += 1
        if computer_ship1_count == 2
          puts "You sank computers small ship"
        end
      elsif @placement.computer_ship2.include?(@placement.player.current_shot)
        puts "Hit, computer ship 2!"
          @grid.player_grid(@placement.player.current_shot, cowboy)
        computer_ship2_count += 1
        if computer_ship2_count == 3
          puts "You sank computers big ship"
        end
      else
        puts "Miss, computer ships"
        @grid.player_grid(@placement.player.current_shot, miss)
      end
      @placement.computer.fire_missile
      if @placement.player_ship1.include?(@placement.computer.current_shot)
        puts "Hit, player ship 1"
        @grid.computer_grid(@placement.computer.current_shot, clown)
        player_ship1_count += 1
        if player_ship1_count == 2
          puts "Computer sank your small ship"
        end
      elsif @placement.player_ship2.include?(@placement.computer.current_shot)
        puts "Hit, player ship 2"
        @grid.computer_grid(@placement.computer.fire_missile, clown)
        player_ship2_count += 1
        if player_ship2_count == 3
          puts "Computer sank your big ship"
        end
      else
        puts "Miss, player ships"
        @grid.computer_grid(@placement.computer.current_shot, miss)
      end
    end
    if computer_ship1_count == 2 && computer_ship2_count == 3
      puts "Congratulations, You won!"
    else
      puts "You lost!"
    end
    finish = Time.now
    diff = finish - start
    puts "Total time of gameplay: #{diff}"
    puts "Number of shots fired: #{@placement.player.fire.length}"
  end
end


battleship = Battleship.new
battleship.intro.pry
