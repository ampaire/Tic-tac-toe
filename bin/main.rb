# frozen_string_literal: true
class UserInterface
    def welcome
        puts ' '
        puts '==========TIC-TAC-TOE=========='
        puts 'Welcome to tic tac toe'
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
  
    def initialize(board =  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
      @board = board
      @moves = 10
    end
  
    def display_board(board)
      puts "-----------"
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      puts "-----------"
    end
  
    def game(one, two)
      while @moves < 10
        # Print the board for user input
        display_board(board)
        # Prompts for user input.
        # Prompts error if user input character other than number between 1 to 9
        p 'Player 1 please enter cell number of where you want to place X'
        user_input = gets.chomp.to_i
        # Print the board after receiving user input
        display_board(board)
        # Prompts for user input.
        # Prompts error if user input character other than number between 1 to 9
        p 'Player 2 please enter cell number of where you want to place O'
        user_input = gets.chomp.to_i
      end
    end
end