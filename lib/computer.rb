require 'pry'
require_relative 'rules'

class Computer
  include Rules
  attr_reader :ship1,
              :ship2,
              :fire,
              :current_shot

  def initialize
    @ship1 = []
    @ship2 = []
    @fire = []
    @current_shot = nil
  end

  def generate_ship1
    random_first_coord = selection_limitations.sample
    ship1 << random_first_coord
    random_second_coord = second_coord_ship_1[random_first_coord].sample
    ship1 << random_second_coord
    return ship1
    generate_ship2
  end

  def generate_ship2
     random_first_coord = selection_limitations.sample
     random_second_coord = second_coord_ship_2[random_first_coord].to_a.sample
     if ship1.include?(random_first_coord)
       generate_ship2
     elsif ship1.include?(random_second_coord[0]) || ship1.include?(random_second_coord[1])
       generate_ship2
     else
       ship2 << random_first_coord
       ship2 << random_second_coord
       @ship2 = ship2.flatten
     end
  end

  def fire_missile
    fire_shot = selection_limitations.sample
    if @fire.include?(fire_shot)
      fire_missile
    else
      @fire << fire_shot
      @current_shot = fire_shot
    end
  end
end
