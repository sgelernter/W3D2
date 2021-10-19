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
                grid[row][col] = Tiles.new(num, given).value
            end
        end
        # debugger
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
        # debugger
        @grid.all? { |row| row.sort == checker }
    end

    def cols_solved?
        checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        # debugger
        @grid.transpose.all? { |row| row.sort == checker }
    end

    def fill_box(row_s,col_s)
        row_ends = row_s + 2
        col_ends = col_s + 2
        box_arr = []
        (row_s..row_ends).each do |a|
            (col_s..col_ends).each do |b|
                box_arr << @grid[a][b]
            end
        end
        box_arr
        
    end

    def boxes_solved?
        all_boxes = []
        checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        (0..2).each do |i|
            (0..2).each do |j|
                all_boxes << fill_box(i*3,j*3)
            end
        end 
        # debugger
        all_boxes.all? {|box| box.sort == checker}
    end

    def solved?
        return true if self.rows_solved? && self.cols_solved? && self.boxes_solved?
        false
    end


    
end

b = Board.from_file("./puzzles/sudoku1_solved.txt")
a = Board.new(b)
p a.boxes_solved?
p a.rows_solved?
p a.cols_solved?

