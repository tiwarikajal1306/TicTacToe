echo "Welcome To TicTacToe"
NUM_OF_CELLS=9
computerSymbol1=X
computerSymbol2=O
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


function chooseLetter()
{

	toss
	if [ $tossCheck -eq 1 ]
	then
		read -p "Choose the letter X or Y" playerSymbol
		echo "Player choose $playerSymbol letter"
		if (( $playerSymbol == $computerSymbol1 ))
		then
			computerSymbol=$computerSymbol2
		else
			computerSymbol=$computerSymbol1
		fi
		echo "computer Symbol is $computerSymbol"

	elif [ $tossCheck -eq 0 ]
	then
		letter=$((RANDOM%2))
		if [ $letter -eq 1 ]
		then
			computerSymbol=$computerSymbol1
			playerSymbol=$computerSymbol2
		else
			computerSymbol=$computerSymbol2
			playerSymbol=$computerSymbol1
		fi
		echo "Computer choose $computerSymbol letter"
		echo "Player Symbol is $playerSymbol"

	fi
}
chooseLetter
