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
      
    def won?
        @@winning_positions.detect do |combo|
          @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
        end
    end

    def input_to_index(input)
        input.to_i - 1
    end
    
    def move(position, token='X')
        @board[position] = token
    end
    
    def position_taken?(input)
        @board[input] == "X" || @board[input] == "O"
    end

    def valid_move?(input)
        input.between?(0, 8) && !position_taken?(input)
    end

    
    def turn
        puts "Choose a spot between 1-9"
        spot = gets.strip
        spot = input_to_index(spot)
        if valid_move?(spot)
          move(spot, current_player)
        else
          turn
        end
        display_board
    end
    
    def turn_count
        taken = 0
        @board.each do |i|
          if i == "X" || i == "O"
            taken += 1
          end
        end
        return taken
    end
    
    def current_player
        player = nil
        if turn_count() % 2 == 0
          player = 'X'
        else
          player = 'O'
        end
        return player
    end
    
    def full?
        turn_count == 9
    end
    
    def draw?
        !won? && full?
    end
    
    def over?
        won? || full? || draw?
    end
    
    def play
        until over?
          turn
        end
    
        if won?
          winner = winner()
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end
end
    
game = TicTacToe.new
game.play
