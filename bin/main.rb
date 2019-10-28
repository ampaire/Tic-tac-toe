#!/usr/bin/ruby

class Player
  attr_accessor :name, :taken
  def initialize(name = 'Player')
    @name = name
    @taken = []
  end
end

class TicTacToe
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_place(inpt, play)
    @board[inpt - 1] = play ? 'O' : 'X'
  end

  def draw_board
    # This will probably be done on the actual game class later in the project
    puts ' ' + @board[0].to_s + ' | ' + @board[1].to_s + ' | ' + @board[2].to_s + ' '
    puts '-----------'
    puts ' ' + @board[3].to_s + ' | ' + @board[4].to_s + ' | ' + @board[5].to_s + ' '
    puts '-----------'
    puts ' ' + @board[6].to_s + ' | ' + @board[7].to_s + ' | ' + @board[8].to_s + ' '
  end
end

class Game
  # In here will be the actual game logic and methods
end

#########
game = TicTacToe.new
game.draw_board