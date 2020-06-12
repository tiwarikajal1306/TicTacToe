echo "Welcome To TicTacToe"
NUM_OF_CELLS=9
computerSymbol1=X
computerSymbol2=O
computerSymbol=a
playerSymbol=b

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
	move=0
#place computer Symbol to win if possible

	for (( cellCheck=1; cellCheck<=NUM_OF_CELLS; cellCheck++ ))
        do

                for ((i=1; i<=NUM_OF_CELLS; i++))
                do
                        if [ $cellCheck -eq $i ]
                        then
                                if (( ${board[i]} != X && ${board[i]} != O ))
                                then
					canComputerWin
					if (( $winnerSymbol == $computerSymbol ))
					then
						winnerSymbol=5
						cellCheck=11
						i=11
						((move++))
	                                else
	                                	board[i]=$i
	                                fi
				fi
                        fi
                done
	done
#place computer Symbol to block player win if possible
	if [ $move -eq 0 ]
	then
		for (( cellCheck=1; cellCheck<=NUM_OF_CELLS; cellCheck++ ))
        	do

                for ((i=1; i<=NUM_OF_CELLS; i++))
                do
                        if [ $cellCheck -eq $i ]
                        then
                                if (( ${board[i]} != X && ${board[i]} != O ))
                                then
                                        canPlayerWin
                                if (( $winnerSymbol == $playerSymbol ))
                                then
					board[cellCheck]=$computerSymbol
                                        winnerSymbol=5
                                        cellCheck=11
                                        i=11
                                        ((move++))

                                else
                                board[i]=$i
                                fi
                                fi
                        fi
                done
        done
	fi
#place computer Symbol on the available corners"
	if [ $move -eq 0 ]
	then
		for(( cell =1; cell<=NUM_OF_CELLS; cell++))
		do
			if (( ${board[cell]} != X && ${board[cell]} != O ))
			then
				case $cell in

					1)
						board[cell]=$computerSymbol
						((move++))
						break
					;;

					3)
						board[cell]=$computerSymbol
                                                ((move++))
                                                break
                                        ;;

					7)
                                                board[cell]=$computerSymbol
                                                ((move++))
                                                break
                                        ;;

					9)
                                                board[cell]=$computerSymbol
                                                ((move++))
                                                break
                                        ;;

					*)
					;;
				esac
			fi
		done
	fi
        if [ $move -eq 0 ]
        then
		cell=0

        	while [ $cell -eq  0 ]
        	do
		 		cellOccupied=0

		                cell=$((RANDOM%9+1))
		                for ((i=1; i<=NUM_OF_CELLS; i++))
		                do
		                        if [ $cell -eq $i ]
		                        then
		                                if (( ${board[i]} != X && ${board[i]} != O ))
		                                then
							board[i]=$computerSymbol
							i=10
		                                else
							cell=0
		                                fi
		                        fi
		                done

		                if [ $cellOccupied -gt 0 ]
		                then
		                        cell=0
	                fi
		        done
		fi

}



function winner()
{
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
}

function canComputerWin()
{
	board[cellCheck]=$computerSymbol
	winnerCheck $computerSymbol
}


function canPlayerWin()
{
	board[cellCheck]=$playerSymbol
	winnerCheck $playerSymbol

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
