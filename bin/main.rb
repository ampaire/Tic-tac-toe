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

  def draw_player_turn
    player = @game.current_player
    available_moves = @game.available_moves
    if  player == :X
      puts '************************************************************'
      puts "*                  #{@player_one} its your turn!           *"
      puts '************************************************************'
    else
      puts '************************************************************'
      puts "*                  #{@player_two} its your turn!           *"
      puts '************************************************************'
    end
    puts '************************************************************'
    p "*             Available moves #{available_moves}          *"
    puts '************************************************************'
  end

  def play_again?
    play_again = gets.chomp
     if @game.valid_char?(play_again)
      if @game.repeat_game?(play_again)
        true
      else
        false
      end
     else
      puts '************************************************************'
      puts '*                   Not a valid input :(                   *'
      puts '*                         Try again                        *'
      puts '*                   Valid inputs -> (y/n)                  *'
      puts '************************************************************'
      play_again?
     end
  end

  def draw_play_again?
    puts '************************************************************'
    puts '*                     Play again? (y/n)                    *'
    puts '************************************************************'
  end

  def move
    point = gets.strip
    point= @game.take_place(point)
    if @game.valid_move?(point)
      @game.player_index(point,@game.current_player)
      draw_player_turn
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
        puts '************************************************************'
        puts "*      CONGRATULATIONS #{player_one} You won this round    *"
        puts '************************************************************'
      else
        puts '************************************************************'
        puts "*      CONGRATULATIONS #{player_two} You won this round    *"
        puts '************************************************************'
      end
    elsif @game.draw?
      puts '************************************************************'
      puts "*                       Oh! Its a draw                     *"
      puts '************************************************************'
    end
  end
end

repeat_game = true

while repeat_game
  game = DisplayInterface.new
  game.draw_welcome
  game.draw_player_turn
  game.draw_board
  game.play
  game.draw_play_again?
  repeat_game = game.play_again?
end

