## Tic-Tac-Toe
Final version of the project.

Made by the Awesome Duo [Effie](https://github.com/ampaire) and [David Garcia](https://github.com/davitomix).

## INSTRUCTIONS

To start the game, in a terminal navigate to the root directory and type:

`ruby bin/main.rb`

or if using Windows you can simply run

`main.exe`

<img  align="right" width="400" src="img/Screen Shot 2019-10-31 at 14.11.35.png">

This is the starting screen of the game, here we have the header which includes the instructions for playing the game.

The first player who is player_one is asked to enter their name and is assigned to use letter `X` in the game while the second player who is player_two is assigned the letter 'O' once they have entered their names. 


On the main game state we have a numbered board, from 1 to 9 and a message prompting for user input. Player 'X' starts typing a number from 1 to 9 and pressing enter. Player 'O' will then be prompted for a number from 1 to 9. 

If a player inputs an invalid number, he'll receive a warning and will be prompted for input again, until a valid value is provided. Game goes on until a player wins or ties. 
The game displays the winner .
<img src="img/Screen Shot 2019-10-31 at 14.11.51.png">