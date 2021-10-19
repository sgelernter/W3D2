require_relative "game.rb"
require_relative "player.rb"
require_relative "card.rb"
class ComputerPlayer

    def initialize
        @known_cards = Hash.new {|h,k| h[k] = []}
        @matched_cards = []
    end

    def receive_revealed_card(pos,value)
        @known_cards[value] << pos if !@known_cards[value].include?(pos)
    end

    def has_match?(value)
        return true if @known_cards[value].length == 2
        false
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
    # end