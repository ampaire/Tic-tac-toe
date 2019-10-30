#!/usr/bin/ruby

# frozen_string_literal: true

require_relative '../lib/game_logic.rb'

class DisplayInterface < GameLogic
  
  def initialize
    @game = GameLogic.new(@players)
  end
  def get_position
    puts 'Which position do you want to take?'
    @position = gets.chomp
  end



  def draw_board
    puts " #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]} "

    puts ' ---------- '

    puts " #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]} "

    puts ' ---------- '

    puts " #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]} "
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
    puts "Player one X is #{@player_one} and Player two O #{@player_two}"
    puts '************************************************************'
    puts 'Game Start!'
  end

  def draw_player_turn(player)
    puts '************************************************************'
    puts "*                  #{@player} its your turn!                *"
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

  def move
    point = gets.strip
    point= @game.take_place(point)
    if @game.valid_move?(point)
      @game.player_index(point,@game.get_current_player)
      draw_board
    else
      puts "Number choosen has already been played"
      puts "You need to enter a valid number between 1-9"
      draw_board
      move
    end
  end
  def play
    move until @game.over?
    if @game.won
      if @game.winner? == :X
        puts "CONGRATULATIONS #{player_one} You won this round"
      else
        puts "CONGRATULATIONS #{player_two} You won this round"
      end
    elsif @game.draw?
      puts "Oh! Its a draw"
    end
  end
end

game = DisplayInterface.new
game.draw_welcome
#game.draw_player_turn()
game.play


# #########
# counter = 0
# # initial instructions for player
# game = DisplayInterface.new
# game.draw_welcome
# PLAYER_1 = true
# PLAYER_2 = false
# while counter < 9
#   # loop for each move
#   if game.get_current_player == PLAYER_1
#     game.draw_player_turn(player_one)
#     position = game.get_position.to_i
#     game.take_place(position, 'X')
#   else 
#     game.draw_player_turn(player_two)
#     position = game.get_position.to_i
#     game.take_place(position, 'O')
#   end
#   game.draw_board
#   game.draw_line
#   counter += 1
# end
