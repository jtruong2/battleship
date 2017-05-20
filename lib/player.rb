require 'pry'

class Player
  attr_reader   :fire,
                :times_fired

  attr_accessor :ship1_coordinates,
                :ship2_coordinates

  def initialize
    @ship1_coordinates = []
    @ship2_coordinates = []
    @fire = nil
    @times_fired = 0
  end

  def get_action
    gets.chomp
  end

  def assign_ship1_coordinates
    puts 'Place your 1st ship(2 units) one coordinate at a time'
    input_1 = get_action
    input_2 = get_action
    ship1_coordinates << input_1
    ship1_coordinates << input_2
  end

  def assign_ship2_coordinates
    puts 'Place your 2nd ship(3 units) one coordinate at a time'
    input_1 = get_action
    input_2 = get_action
    if @ship1_coordinates.include?(input_1)
      puts 'Your ships are overlapping, enter new coordinates for ship 2 one coordinate at a time'
      assign_ship2_coordinates
    elsif @ship1_coordinates.include?(input_2)
      puts 'Your ships are overlapping, enter new coordinates for ship 2 one coordinate at a time'
      assign_ship2_coordinates
    else
      ship2_coordinates << input_1
      ship2_coordinates << input_2
    end
  end

  def fire_missile
    input_1 = get_action
    @fire = input_1
    @times_fired += 1 #don't forget to decrement if invalid selection
    return @fire
  end

  # def reset_ship1_coordinates
  #   @ship1_coordinates = @ship1_coordinates.clear
  # end
  #
  # def reset_ship2_coordinates
  #   @ship2_coordinates = @ship2_coordinates.clear
  # end
end
