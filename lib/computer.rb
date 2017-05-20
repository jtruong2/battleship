require 'pry'

class Computer
  attr_reader :ship1_coordinates,
              :ship2_coordinates,
              :fire

  def initialize
    @ship1_coordinates = []
    @ship2_coordinates = []
    @fire = nil
    @first_coord =
    ['A1','A2','A3','A4',
    'B1','B2','B3','B4',
    'C1','C2','C3','C4',
    'D1','D2','D3','D4']
  end

  def generate_coordinates_for_ship1
    second_coord_ship_1 =
    {"A1"=>["A2", "B1"],
     "A2"=>["A1", "B2", "A3"],
     "A3"=>["A2", "B3", "A4"],
     "A4"=>["A3", "B4"],
     "B1"=>["A1", "B2", "C1"],
     "B2"=>["B1", "A2", "B3", "C2"],
     "B3"=>["B2", "A3", "B4", "C3"],
     "B4"=>["B3", "A4", "C4"],
     "C1"=>["B1", "C2","D1"],
     "C2"=>["C1", "B2", "C3", "D2"],
     "C3"=>["C2", "B3", "C4", "D3"],
     "C4"=>["C3", "B4", "D4"],
     "D1"=>["C1", "D2"],
     "D2"=>["D1", "C2", "D3"],
     "D3"=>["D2", "C3", "D4"],
     "D4"=>["D3", "C4"]}

    random_first_coord = @first_coord.sample
    ship1_coordinates << random_first_coord

    random_second_coord = second_coord_ship_1[random_first_coord].sample
    ship1_coordinates << random_second_coord
  end

  def generate_coordinates_for_ship2
    second_coord_ship_2 =
    {"A1"=>["A3", "C1"],
     "A2"=>["C2", "A4"],
     "A3"=>["A1", "C3"],
     "A4"=>["A2", "C4"],
     "B1"=>["A3", "D1"],
     "B2"=>["D2", "A4"],
     "B3"=>["B1", "D3"],
     "B4"=>["B2", "D4"],
     "C1"=>["A1", "C3"],
     "C2"=>["A2", "C4"],
     "C3"=>["C1", "A3"],
     "C4"=>["C2", "A4"],
     "D1"=>["B1", "D3"],
     "D2"=>["B2", "D4"],
     "D3"=>["B3", "D1"],
     "D4"=>["D2", "B4"]}

     random_first_coord = @first_coord.sample
     ship2_coordinates << random_first_coord

     random_second_coord = second_coord_ship_2[random_first_coord].sample
     ship2_coordinates << random_second_coord
  end

  def fire_missile
    @fire = @first_coord.sample
  end

end
