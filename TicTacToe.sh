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
echo "|| ${board[1]} || ${board[2]} || ${board[3]} ||"
echo "-----------------"
echo "|| ${board[4]} || ${board[5]} || ${board[6]} ||"
echo "-----------------"

echo "|| ${board[7]} || ${board[8]} || ${board[9]} ||"

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
                read -p "Choose the letter X or O" playerSymbol
                echo "Player choose $playerSymbol letter"
                if [[ $playerSymbol == $computerSymbol1 ]]
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

function display()
{
        echo "Board is display : "
echo "|| ${board[1]} || ${board[2]} || ${board[3]} ||"
echo "-----------------"
echo "|| ${board[4]} || ${board[5]} || ${board[6]} ||"
echo "-----------------"

echo "|| ${board[7]} || ${board[8]} || ${board[9]} ||"


}

function playerChooseCell()
{
        cell=0
        while [ $cell -eq  0 ]
        do
                read -p "Enter the cell number " cell
		 cellOccupied=0

                for ((i=1; i<=NUM_OF_CELLS; i++))
                do
                        if [ $cell -eq $i ]
                        then
                                if (( ${board[i]} == X || ${board[i]} == O ))
                                then
                                        ((cellOccupied++))
                                else
                                board[i]=$playerSymbol
                                fi
                        fi
                done

                if [ $cellOccupied -gt 0 ]
                then
                        echo "Cell alredy occupied please enter valid cell"
                        cell=0
                fi
        done
}
function computerChooseCell()
{
        cell=0
        while [ $cell -eq  0 ]
        do
		 cellOccupied=0

                cell=$((RANDOM%9+1))
                for ((i=1; i<=NUM_OF_CELLS; i++))
                do
                        if [ $cell -eq $i ]
                        then
                                if (( ${board[i]} == X || ${board[i]} == O ))
                                then
                                        ((cellOccupied++))
                                else
                                board[i]=$computerSymbol
                                fi
                        fi
                done

                if [ $cellOccupied -gt 0 ]
                then
                        echo "Cell alredy occupied please enter valid cell"
                        cell=0
                fi
        done

}



function winner()
{
	finalWinner=1
	winnerSymbol=$symbol
}

function winnerCheck()
{
        symbol=$1
        if [[ ${board[1]} == $symbol && ${board[2]} == $symbol && ${board[3]} == $symbol ]]
        then
                winner

        elif [[ ${board[4]} == $symbol && ${board[5]} == $symbol && ${board[6]} == $symbol ]]
        then
                winner

        elif [[ ${board[7]} == $symbol && ${board[8]} == $symbol && ${board[9]} == $symbol ]]
        then
                winner

        elif [[ ${board[1]} == $symbol && ${board[4]} == $symbol && ${board[7]} == $symbol ]]
        then
                winner

        elif [[ ${board[2]} == $symbol && ${board[5]} == $symbol && ${board[8]} == $symbol ]]
        then
                winner

        elif [[ ${board[3]} == $symbol && ${board[6]} == $symbol && ${board[9]} == $symbol ]]
        then
                winner

        elif [[ ${board[1]} == $symbol && ${board[5]} == $symbol && ${board[9]} == $symbol ]]
        then
                winner

        elif [[ ${board[3]} == $symbol && ${board[5]} == $symbol && ${board[7]} == $symbol ]]
        then
                winner
        elif [[ ${board[1]} != 1 && ${board[2]} != 2 && ${board[3]} != 3 && ${board[4]} != 4 && ${board[5]} != 5 && ${board[6]} != 6 && ${board[7]} != 7 && ${board[8]} != 8 && ${board[9]} != 9 ]]
        then
               winnerSymbol=T

        fi
	flag=1
}
winnerSymbol=5

chanceCount=1
while [[ winnerSymbol -eq 5 && chanceCount -lt 10 ]]
do
if [ $tossCheck -eq 1 ]
then
        playerChooseCell
        display
        winnerCheck $playerSymbol
	((chanceCount++))
	if [[ $winnerSymbol != $playerSymbol && chanceCount -lt 10 ]]
	then
        computerChooseCell
        display
        winnerCheck $computerSymbol
       	((chanceCount++))
	fi
else
	computerChooseCell
        display
        winnerCheck $computerSymbol
        ((chanceCount++))
	if [[ $winnerSymbol != $computerSymbol && chanceCount -lt 10 ]]
        then
	playerChooseCell
        display
        winnerCheck $playerSymbol
        ((chanceCount++))

	fi
fi
done
if [[ $winnerSymbol == $playerSymbol ]]
then
	echo "player Win"
elif [[ $winnerSymbol == $computerSymbol ]]
then
	echo "computer Win"
else
	echo "Game tied"
fi
