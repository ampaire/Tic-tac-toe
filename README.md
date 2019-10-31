## Tic-Tac-Toe
Final version of the project.

Made by the Awesome Duo [Effie](https://github.com/ampaire) and [David Garcia](https://github.com/davitomix).

## INSTRUCTIONS

To start the game, in a terminal navigate to the root directory and type:

`ruby bin/main.rb`

or if using Windows you can simply run

`main.exe`

<img  align="right" width="400" src="img/Screen Shot 2019-10-31 at 14.11.35.png">

This is the starting screen of the game, here we have the header and two options, play vs human, which can be done by pressing "h" (not case sensitive) and pressing enter, or play vs computer, in a similar fashion typing "c" (not case sensitive) and pressing enter. This will lead to the main game.



On the main game state we have a numbered board, from 1 to 9, a list of valid moves and a message prompting for user input. Player X starts typing a number from the valid moves list and pressing enter. Player O will be prompted for a number from the valid moves list. If a player inputs an invalid number, he'll receive a warning and will be prompted for input again, until a valid value is provided. Game goes on until a player wins or ties. Players can play again by submitting "y", or quit after game over by submitting an "n". The game also keeps a score that is displayed by the end of each match.

<img src="Screen Shot 2019-10-31 at 14.11.51.png">