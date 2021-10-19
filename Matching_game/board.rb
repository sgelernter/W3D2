require_relative "./card.rb"

class Board

    attr_reader :board, :deck

    def initialize(size)
        raise "Size must be even" if !size.even?
        @board = Array.new(size) {Array.new(size, "_")}
        @deck = []
        @size = size
    end

    def build_deck
        total_pairs = (@size**2) / 2
        (0...total_pairs).each do |i|
            @deck << Card.new(i)
            @deck << Card.new(i)
        end
    end

    def populate
        shuffled = @deck.dup.shuffle
        count = 0
        (0...@size).each do |row|
            (0...@size).each do |col|
                @board[row][col] = shuffled[count]
                count +=1
            end
        end
        true
    end

    # def [](pos)
    #     row,col = pos
    #     @board[row][col]
    # end
    
    def render
        (0...@size).each do |row|
            (0...@size).each do |col|
                  @board[row][col].print_card
            end
            puts 
        end      

    end

    


end