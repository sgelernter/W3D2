class HumanPlayer

    def initialize

    end

    def get_guess
        puts "Enter a guess: "
        guess = gets.chomp
        position = guess.split(" ").map(&:to_i)
        position
    end
end