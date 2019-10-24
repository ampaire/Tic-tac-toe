# frozen_string_literal: true 

class TicTacToe
    def initialize
        @board = nil
    end

    @@winning_positions = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
      ]  
    
end