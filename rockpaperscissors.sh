function game_menu() {
    clear
    echo -e "
\e[36mRock, Paper, Scissors, by Nicolas Marzagão\e[0m
- Rock beats scissors.
- Paper beats rocks.
- Scissors beats paper.

\e[32m${1}\e[0m Wins, \e[31m${2}\e[0m Losses, \e[33m${3}\e[0m Ties
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
    read pc

    player_choice=${pc^^}

    if [[ $player_choice == "Q" ]]
    then
        clear
        echo -e "\e[32mThanks for playing!\e[0m"
        break
    elif [[ $player_choice == "R" || $player_choice == "P" || $player_choice == "S" ]]
    then
        computer_choice=$(get_computer_choice)

        clear
        echo "Rock"
        sleep 0.5
        echo "Paper"
        sleep 0.5
        echo "Scissors"
        sleep 0.5
        echo "Shoot!"
        echo ""

        case $player_choice in
            "R")
                case $computer_choice in
                    "P")
                        echo -e "\e[31mYou Lose!\e[0m"
                        ((losses++))
                    ;;
                    "S")
                        echo -e "\e[32mYou Win!\e[0m"
                        ((wins++))
                    ;;
                    *)
                        echo -e "\e[33mIt's a Tie!\e[0m"
                        ((ties++))
                    ;;
                esac
            ;;
            "P")
                case $computer_choice in
                    "S")
                        echo -e "\e[31mYou Lose!\e[0m"
                        ((losses++))
                    ;;
                    "R")
                        echo -e "\e[32mYou Win!\e[0m"
                        ((wins++))
                    ;;
                    *)
                        echo -e "\e[33mIt's a Tie!\e[0m"
                        ((ties++))
                    ;;
                esac
            ;;
            *)
                case $computer_choice in
                    "R")
                        echo -e "\e[31mYou Lose!\e[0m"
                        ((losses++))
                    ;;
                    "P")
                        echo -e "\e[32mYou Win!\e[0m"
                        ((wins++))
                    ;;
                    *)
                        echo -e "\e[33mIt's a Tie!\e[0m"
                        ((ties++))
                    ;;
                esac
            ;;
        esac

        echo "Press Enter to Continue"
        read continue
    else
        echo -e "\e[31mInvalid Input!\e[0m"
        echo "Press Enter to Continue"
        read continue
    fi
done
