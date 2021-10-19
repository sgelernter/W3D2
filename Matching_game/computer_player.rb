require_relative "game.rb"
require_relative "player.rb"
require_relative "card.rb"
class ComputerPlayer

    def initialize(size)
        @known_cards = Hash.new {|h,k| h[k] = []}
        @matched_cards = []
        @size = size
    end

    # def all_positions
    #     positions = (0...@size).map do |row|
    #                     (0...@size).map do |col|
    #                         [row, col]
    #                     end
    #                 end
    # end

    def receive_revealed_card(pos,value)
        @known_cards[value] << pos if !@known_cards[value].include?(pos)
    end

    def has_match?(value)
        return true if @known_cards[value].length == 2
        false
    end

    def get_guess
        @known_cards.each do |value, positions|
            if has_match?(value) && #cards are not yet revealed
                guess_position = positions[0]
                positions.rotate!
            end
        end

        not_guessed = true
        while not_guessed
            row_try = rand(0...@size)
            col_try = rand(0...@size)
            pos_try = [row_try, col_try]
            if !@known_cards.has_value?(pos_try)
                not_guessed = false 
                guess_position = pos_try
            end
        end
        return guess_position
    end

end

# def get_guess
    #     puts "Enter a guess: "
    #     guess = gets.chomp
    #     position = guess.split(" ").map(&:to_i)
    #     position
    # end

    # def make_guess(pos)
    #     row, col = pos
    #     value = @board[pos].reveal 
    #     @board.render
    #     value
    # # end

    # (0...size).each sodaiajsodiaj
    #     (0...size). each soadjaosidjsa
    #         not_seen << (position) if !knowncards.values.flatten
    #     end
    # end
    # not_seen.sample