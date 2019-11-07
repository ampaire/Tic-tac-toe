# frozen_string_literal: true

require_relative './players.rb'

class GameLogic
  attr_reader :board, :player_one, :player_two, :X, :O
  def initialize(players, board = (1..9).to_a)
    @board = board
    @player_one = Player.new(players)
    @player_two = Player.new(players)
  end

  SURE_WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def won
    SURE_WINS.detect do |combo|
      @board [combo[0]] == @board [combo[1]] &&
        @board [combo[1]] == @board [combo[2]] &&
        board_full?(combo[0])
    end
  end

  def player_index(index, input = :X)
    @board[index] = input
  end

  def board_full?(index)
    @board[index] == :X || @board[index] == :O
  end

  def take_place(inpt)
    inpt.to_i - 1
  end

  def count_turns
    @board.select { |e| %i[X O].include?(e) }.size
  end

  def available_moves
    available_moves = @board.select { |e| (1..9).include?(e) }
  end

  def valid_move?(position)
    position.between?(0, 8) && !board_full?(position)
  end

  def valid_char?(element)
    valid = if element != 'y' && element != 'Y' && element != 'n' && element != 'N'
              false
            else
              true
            end
  end

  def repeat_game?(element)
    @repeat_game = if %w[y Y].include?(element)
                     true
                   else
                     false
                   end
  end

  def full?
    count_turns == 9
  end

  def draw?
    !won && full?
  end

  def over?
    won || full? || draw?
  end

  def current_player
    current_player = if (count_turns % 2).zero?
                       :X
                     else
                       :O
                     end
  end

  def winner?
    if @board[won.first] == :X
      :X
    else
      :O
    end
  end
end
