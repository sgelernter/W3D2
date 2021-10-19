require "byebug"
require_relative "tiles.rb"
class Board

    
    def self.from_file(puzzle)
        grid = Array.new(9){Array.new(9)}
        rows = File.readlines(puzzle).map(&:chomp)
        (0...9).each do |row|
            (0...9).each do |col|
                num = rows[row][col].to_i
                given = true
                given = false if num == 0 
                grid[row][col] = Tiles.new(num, given)
            end
        end
        debugger
        return grid
    end

    def initialize(grid)
        
    end
    
end

Board.from_file("./puzzles/sudoku3.txt")

