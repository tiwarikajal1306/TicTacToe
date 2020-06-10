#!/bin/bash -x
echo "Welcome To TicTacToe"
NUM_OF_CELLS=9
#variables
declare -a board

function resetBoard()
{
   for ((i=1; i<=NUM_OF_CELLS; i++))
   do
         board[$i]=$i
   done
echo "Board is display : "
printf "|| ${board[1]} || ${board[2]} || ${board[3]} ||\n"
printf "|| ${board[4]} || ${board[5]} || ${board[6]} ||\n"
printf "|| ${board[7]} || ${board[8]} || ${board[9]} ||\n"

}

resetBoard

function toss()
{
	tossCheck=$((RANDOM%2))
	if [ $tossCheck -eq 1 ]
	then
		echo "Player turn"
	else
		echo "Computer turn"
	fi
}

toss
