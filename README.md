## Tic-Tac-Toe

## Rules

- Play occurs on a 3 by 3 grid of 9 squares.

- Two players takes turns only in the empty squares, the first making x's, the second o's.

- A row is any three squares on the grid, adjacent, diagonally, vertically, or horizontally.

- If one player places three of the same marks in a row, the player WINS! :D

- If the spaces are all filled and there is no winner, the game ends in a draw. :( 

Made by the Awesome Duo [Effie](https://github.com/ampaire) and [David Garcia](https://github.com/davitomix).

## Instructions

To start the game, in a terminal navigate to the root directory and type:

`ruby bin/main.rb`

or if using Windows you can simply run

`main.exe`

<img  align="right" width="400" src="img/1.png">

This is the starting screen of the game, here we have the header which includes the instructions for playing the game.

The first player who is player_one is asked to enter their name and is assigned to use letter `X` in the game while the second player who is player_two is assigned the letter 'O' once they have entered their names. 


On the main game state we have a numbered board, from 1 to 9 and a message prompting for user input. Player 'X' starts typing a number from 1 to 9 and pressing enter. Player 'O' will then be prompted for a number from 1 to 9. 

If a player inputs an invalid number, he'll receive a warning and will be prompted for input again, until a valid value is provided. Game goes on until a player wins or ties. 
The game displays the winner.

<img src="img/2.png">