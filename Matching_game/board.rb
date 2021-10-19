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
        (0..total_pairs).each do |i|
            @deck << Card.new(i)
            @deck << Card.new(i)
        end
    end

    # def populate


    #     placed_pairs = 0
    #     while placed_pairs < total_pairs 
    #         # pair_1 = rand(0..total_pairs)
    #         # pair_2 = pair_1
    #         pair_value = rand(0..total_pairs)
    #         card_1 = Card.new(pair_value)
    #         card_2 = Card.new(pair_value)
    #         row = rand(0...size)
    #         col = rand(0...size)
    #         if @board[row][col] == "_" && (@deck.count {|card| card == card_1 }) < 2
    #             @board[row][col] = card_1
    #             @deck << card_1
    #         end 


    #     end
    # end

end