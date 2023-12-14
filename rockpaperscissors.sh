function game_menu() {
    clear
    echo "
Rock, Paper, Scissors, by Nicolas Marzagão
- Rock beats scissors.
- Paper beats rocks.
- Scissors beats paper.

${1} Wins, ${2} Losses, ${3} Ties
Enter your move: (R)ock (P)aper (S)cissors or (Q)uit
"
}

function get_computer_choice() {
    local random_number=$((1 + RANDOM % 3))

    case $random_number in
        1)
            computer_choice="R"
        ;;
        2)
            computer_choice="P"
        ;;
        *)
            computer_choice="S"
        ;;
    esac

    echo $computer_choice
}

wins=0
losses=0
ties=0

while [[ 1 ]]
do
    game_menu $wins $losses $ties
    read player_choice

    if [[ $player_choice == "Q" ]]
    then
        echo "Thanks for playing!"
        break
    elif [[ $player_choice == "R" || $player_choice == "P" || $player_choice == "S" ]]
    then
        computer_choice=$(get_computer_choice)

        echo "Your choice: $player_choice"
        echo "Computer's choice: $computer_choice"

        case $player_choice in
            "R")
                case $computer_choice in
                    "P")
                        echo "You Lose!"
                        ((losses++))
                    ;;
                    "S")
                        echo "You Win!"
                        ((wins++))
                    ;;
                    *)
                        echo "It's a Tie!"
                        ((ties++))
                    ;;
                esac
            ;;
            "P")
                case $computer_choice in
                    "S")
                        echo "You Lose!"
                        ((losses++))
                    ;;
                    "R")
                        echo "You Win!"
                        ((wins++))
                    ;;
                    *)
                        echo "It's a Tie!"
                        ((ties++))
                    ;;
                esac
            ;;
            *)
                case $computer_choice in
                    "R")
                        echo "You Lose!"
                        ((losses++))
                    ;;
                    "P")
                        echo "You Win!"
                        ((wins++))
                    ;;
                    *)
                        echo "It's a Tie!"
                        ((ties++))
                    ;;
                esac
            ;;
        esac

        echo "Press Enter to Continue"
        read continue
    else
        echo "Invalid Input!"
        echo "Press Enter to Continue"
        read continue
    fi
done
