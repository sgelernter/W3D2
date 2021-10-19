require "byebug"
require_relative "tiles.rb"
class Board

    attr_reader :grid
    
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
        return grid
    end

    def initialize(grid)
        @grid = grid
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def render
        @grid.each do |row|
            @grid.each do |col|
                print " #{@grid[row][col]} "
            end
            puts
        end
    end

    def rows_solved?
        checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @grid.all? { |row| row.sort == checker }
    end

    def cols_solved?
        checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @grid.transpose.all? { |row| row.sort == checker }
    end

    def boxes_solved?

    end

    def solved?
        return true if self.rows_solved? && self.cols_solved? && self.boxes_solved?
        false
    end


    
end

# Board.from_file("./puzzles/sudoku3.txt")
