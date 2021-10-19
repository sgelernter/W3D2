require_relative "board.rb"
require_relative "card.rb"
require_relative "player.rb"
require_relative "computer_player.rb"
require "byebug"

class Game

    def initialize(size)
        @board = Board.new(size)
        @player = HumanPlayer.new
        @computer = ComputerPlayer.new
    end

    # def get_guess
    #     puts "Enter a guess: "
    #     guess = gets.chomp
    #     position = guess.split(" ").map(&:to_i)
    #     position
    # end

    def make_guess(pos)
        row, col = pos
        value = @board[pos].reveal 
        @board.render
        value
    end

    def play
        @board.build_deck
        @board.populate
        while !@board.won?
            @board.render 

            position = @player.get_guess
            make_guess(position)
            @computer.receive_revealed_card(position, @board[position].value)

            position_2 = @player.get_guess
            make_guess(position_2)
            @computer.receive_revealed_card(position_2, @board[position_2].value)
            
            if @board[position] != @board[position_2] 
                sleep(2)
                @board[position].hide
                @board[position_2].hide
            end
            system("clear")
        end
        #game is over, execute whatever happens then
    end
end

game = Game.new(4)
game.play