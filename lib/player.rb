require 'pry'
require_relative 'rules'
class Player
  include Rules
  attr_reader   :ship1,
                :ship2,
                :fire,
                :current_shot

  def initialize
    @ship1 = []
    @ship2 = []
    @fire = []
    @current_shot = nil
  end


  def find_ship1_coordinate1
    puts 'Place your 1st coordinate for your Destroyer'
    input = get_action
    if !selection_limitations.include?(input)
      invalid_ship_response
      find_ship1_coordinate1
    else
      ship1 << input
    end
  end

  def find_ship1_coordinate2
    puts 'Place your 2nd coordinate for your Destroyer'
    input = get_action
    if !selection_limitations.include?(input) || !second_coord_ship_1[ship1[0]].include?(input) || ship1.include?(input)
      invalid_ship_response
      find_ship1_coordinate2
    else
      ship1 << input
    end
  end


  def find_ship2_coordinate1
    puts 'Place your 1st coordinate for your Cruiser'
    input = get_action
    if !selection_limitations.include?(input) || ship1.include?(input)
      invalid_ship_response
      find_ship2_coordinate1
    else
      ship2 << input
    end
  end

  def find_ship2_coordinate2
    puts 'Place your 2nd coordinate for your Cruiser'
    input = get_action
    if ship2.include?(input) || !second_coord_ship_2[ship2[0]].include?(input) || ship1.include?(input)
      invalid_ship_response
      find_ship2_coordinate2
    else
      ship2 << input
    end
  end

  def fire_missile
    puts 'Enter coordinates to fire'
    input = get_action
    if !selection_limitations.include?(input) || fire.include?(input)
      invalid_fire_response; fire_missile
    else
      @fire << input
      @current_shot = input
    end
  end

  def invalid_ship_response
    puts "Your ship coordinate is invalid, try again!"
  end

  def invalid_fire_response
    puts "Invalid shot, fire again"
  end

  def get_action
    gets.chomp.upcase
  end
end
