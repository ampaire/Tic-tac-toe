require_relative '../lib/players.rb' 

class GameLogic
    attr_reader :board, :player_one, :player_two, :X , :O
    def initialize(players, board = (1..9).to_a)
        @board = board
        @player_one = Player.new(players)
        @player_two = Player.new(players)
       
    end

    SURE_WINS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6] , [1,4,7], [2,5,8], [0,4,8], [2,4,6]].freeze

    def won
        SURE_WINS.detect.do |combo|
        @board [combo[0]] == @board [combo[1]] &&
        @board [combo[1]] == @board [combo[2]] &&
        board_full?(combo[0])
    end
    
    def board_full?(index)
        @board[index] == :X || @board[index] == :O
    end

    def take_place(inpt, play)
        @board[inpt - 1] = play if play == 'O' || play == 'X'
        @total_moves -= 1
    end

    def count_turns
        @board.select{ |e| e == :X || e == :O}.size
    end
    


    def valid_move?(position)
        position.between?(0,8) && !board_full?(position)
    end

    def game_draw
        !won && board_full?
    end

    def get_current_player
        if @total_moves%2 == 0
          @current_player = player_two
        else
          @current_player = player_one
        end
    end

    def winner?
        if @board[won?.first] == X
            :X
        else
            :O
        end
    end

    def game_over
        won? || board_full?||game_draw
    end

end