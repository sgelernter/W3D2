class Card
    attr_reader :value, :face_up, :card_back
    def initialize(value)
        @value = value
        @face_up = false
        @card_back = "_"
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s

    end

    def ==(other_card)
        self.value == other_card.value
    end

    def print_card
        if @face_up
            print self.value
        else
            print self.card_back
        end
        true
    end
end