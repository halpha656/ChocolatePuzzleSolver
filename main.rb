require 'Time'
require './PentominoSolver.rb'
require './ChocolateSolver.rb'

puts "Choose the problem. Pentomino(6x10):1, Hexomino(6x11):2"

loaded = false
while !loaded do
    c = gets.chomp
    if c == "1"
        solver = PentominoSolver.new
        loaded = true
    elsif c == "2"
        solver = ChocolateSolver.new
        loaded = true
    else
        puts "Invalid input. Try again:"
    end
end

starttime = Time.now
solver.solve
calctime = Time.now - starttime

puts "Calculation time: #{calctime}"
solver.display_solution(3)