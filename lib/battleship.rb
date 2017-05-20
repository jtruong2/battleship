require 'pry'
puts 'Welcome to BATTLESHIP'
puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit'
user_input = gets.chomp.downcase

instructions = File.read("/Users/jimmytruong/turing/1module/projects/battleship/instructions/instructions.md")

if user_input == 'p'
  #continue to ship layout
elsif user_input == 'i'
  puts instructions
elsif user_input == 'q'
  #exit program
else
  puts "Invalid response!"
end

class BattleShip

end
