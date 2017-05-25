require 'pry'
require_relative 'player'
require_relative 'computer'
require_relative 'grid'

class Battleship
  attr_reader :player,
              :computer,
              :grid


  def initialize
    @player = Player.new
    @computer = Computer.new
    @grid = Grid.new
    @player_ship1_count = 0
    @player_ship2_count = 0
    @computer_ship1_count = 0
    @computer_ship2_count = 0
    @start = nil
  end


  def intro
    display_intro
    response = gets.chomp.downcase
    case response
      when 'p' then ship_layout
      when 'i' then puts instructions
      when 'q' then puts 'Goodbye!' + "\u{1F590}" ; exit 1
      else puts "Invalid response! \n\n\n Go (b)ack" ; go_back
    end
  end

  def ship_layout
    place_computer_ships
    place_player_ships
    fire_shot
  end

  def fire_shot
    @start = Time.now
    until (@player_ship1_count == 2 && @player_ship2_count == 3) || (@computer_ship1_count == 2 && @computer_ship2_count == 3) do
      player.fire_missile
      player_fires_at_computer
      computer.fire_missile
      computer_fires_at_player
    end
    gameover
  end

  def display_intro
    puts 'Welcome to BATTLESHIP' + "\u{1F6F3}"
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit'
  end

  def go_back
    go_back = gets.chomp.upcase
    if go_back == 'B'
      intro
    end
  end

  def instructions
    puts File.read("/Users/jimmytruong/turing/1module/projects/battleship/instructions/instructions.md")
    go_back
  end

  def place_computer_ships
    computer.generate_ship1
    computer.generate_ship2
  end

  def place_player_ships
    player.find_ship1_coordinate1
    player.find_ship1_coordinate2
    player.find_ship2_coordinate1
    player.find_ship2_coordinate2
  end

  def player_fires_at_computer
    hit = "\u{1F4A5}"; miss = "\u{274C}"
    if computer.ship1.include?(player.current_shot)
      puts "You hit their Destroyer" + "\u{1F4A5}"
      grid.player_grid(player.current_shot, hit)
      @computer_ship1_count += 1
      puts "You sank their Destroyer" + "\u{1F604}" if @computer_ship1_count == 2
    elsif computer.ship2.include?(player.current_shot)
      puts "You hit their Cruiser!" + "\u{1F4A5}"
      grid.player_grid(player.current_shot, hit)
      @computer_ship2_count += 1
      puts "You sank their Cruiser" + "\u{1F604}" if @computer_ship2_count == 3
    else
      puts "Miss, computer ships"
      grid.player_grid(player.current_shot, miss)
    end
  end

  def computer_fires_at_player
    hit = "\u{1F4A5}"; miss = "\u{274C}"
    if player.ship1.include?(computer.current_shot)
      puts "They hit your Destroyer" + "\u{1F4A5}"
      grid.computer_grid(computer.current_shot, hit)
      @player_ship1_count += 1
      puts "They sank your Destroyer" + "\u{1F62B}" if @player_ship1_count == 2
    elsif player.ship2.include?(computer.current_shot)
      puts "They hit your Cruiser" + "\u{1F4A5}"
      grid.computer_grid(computer.fire_missile, hit)
      @player_ship2_count += 1
      puts "They sank your Cruiser" + "\u{1F62B}" if @player_ship2_count == 3
    else
      puts "Miss, player ships"
      grid.computer_grid(computer.current_shot, miss)
    end
  end

  def gameover
    if @computer_ship1_count == 2 && @computer_ship2_count == 3
      puts "\u{1F3C6}" + " Congratulations, You are VICTORIOUS! " + "\u{1F3C6}"
    else
      puts "So Sad!! You lost!" + "\u{1F62B}"
    end
    finish = Time.now
    diff = finish - @start
    puts "\u{23F1}" + " Total time of gameplay: #{diff}"
    puts "\u{1F52B}" + " Number of shots fired: #{player.fire.length}"
    exit 1
  end
end


battleship = Battleship.new
battleship.intro.pry
