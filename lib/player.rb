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
    input_1 = get_action
    input_2 = get_action
    @ship1_coordinates << input_1
    @ship1_coordinates << input_2
  end

  def assign_ship2_coordinates
    input_1 = get_action
    input_2 = get_action
    @ship2_coordinates << input_1
    @ship2_coordinates << input_2
  end

  def fire_missile
    input_1 = get_action
    @fire = input_1
    @times_fired += 1 #don't forget to decrement if invalid selection
    return @fire
  end
end
