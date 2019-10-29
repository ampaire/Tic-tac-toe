#!/usr/bin/ruby

class Player
  attr_accessor :name, :taken
  def initialize(name = 'Player')
    @name = name
    @taken = []
  end
end

class DisplayInterface
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_place(inpt, play)
    @board[inpt - 1] = play if play == 'O' || play == 'X'
  end

  def draw_board
    # The board, it will later be done through the logic for the game
    puts ' ' + @board[0].to_s + ' | ' + @board[1].to_s + ' | ' + @board[2].to_s + ' '
    puts '-----------'
    puts ' ' + @board[3].to_s + ' | ' + @board[4].to_s + ' | ' + @board[5].to_s + ' '
    puts '-----------'
    puts ' ' + @board[6].to_s + ' | ' + @board[7].to_s + ' | ' + @board[8].to_s + ' '
  end

  def draw_line
    puts '.................................................'
  end

  def draw_welcome
    puts '************************************************************'
    puts '*                        TIC-TAC-TOE                       *'
    puts '************************************************************'
    puts "      by the Awesome Duo: Effie & David\n\n"
    puts '                                                 '
    puts '-------------GAME INSTRUCTIONS---------------'
    puts 'The first player takes X and the second player takes O'
    puts 'Choose numbers from 1 to 9 to select desired cell'
    puts 'No duplicate numbers are allowed'
    puts '--------------------------------'
    puts 'Player 1: What is your name?:'
    player_one = gets.chomp
    puts 'Player 2: What is your name?:'
    player_two = gets.chomp
    puts '************************************************************'
    puts "Player one X is #{player_one} and Player two O #{player_two}"
    puts '************************************************************'
  end
end
class TicTacToe

end

#########
game = DisplayInterface.new
game.draw_welcome
game.draw_board
game.draw_line
game.take_place(2, 'X')
game.draw_board
game.draw_line
game.take_place(5, 'O')
game.draw_board
game.draw_line
game.take_place(4, 'a')
game.draw_board
game.draw_line