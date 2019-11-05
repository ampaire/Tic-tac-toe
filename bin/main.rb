#!/usr/bin/ruby

#require_relative '/lib/game_logic.rb'

class DisplayInterface
  attr_reader :board, :player_one, :player_two

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @total_moves = 9
  end

  def take_place(inpt, play)
    @board[inpt - 1] = play if play == 'O' || play == 'X'
    @total_moves -= 1
  end

  def get_position
    puts 'Wich position do you want to take?'
    @position = gets.chomp
  end

  def get_current_player
    if @total_moves%2 == 0
      @current_player = player_two
    else
      @current_player = player_one
    end
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
    puts '############################################################'
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
    @player_one = gets.chomp
    puts 'Player 2: What is your name?:'
    @player_two = gets.chomp
    puts '************************************************************'
    puts "Player one X is #{player_one} and Player two O #{player_two}"
    puts '************************************************************'
    puts 'Game Start!'
  end

  def draw_player_turn(player)
    puts '************************************************************'
    puts "*                  #{player} its your turn!                *"
    puts '************************************************************'
  end

  def draw_available_moves(array)
    puts '************************************************************'
    puts "*       This are the available moves  #{array}             *"
    puts '************************************************************'
  end

  def invalid_move
    puts '************************************************************'
    puts '*                This move is not valid!                   *'
    puts '************************************************************'
  end

  def winning_move
    puts '************************************************************'
    puts '*                This is a winning move!                   *'
    puts '************************************************************'
  end

  def draw_move
    puts '************************************************************'
    puts '*                    This is a draw!                       *'
    puts '************************************************************'
  end
end

#########
counter = 0
game_on = true
# initial instructions for player
game = DisplayInterface.new
game.draw_welcome
player_one = game.player_one
player_two = game.player_two
while game_on
  # loop for each move
  if game.get_current_player == player_one
    game.draw_player_turn(player_one)
    position = game.get_position.to_i
    game.take_place(position, 'X')
  else 
    game.draw_player_turn(player_two)
    position = game.get_position.to_i
    game.take_place(position, 'O')
  end
  game.draw_board
  game.draw_line
  counter += 1
  if counter > 8
    game_on = false
  end
end

left_positions = [2, 4, 5, 8]
game.draw_available_moves(left_positions)
game.invalid_move
game.winning_move
game.draw_move
