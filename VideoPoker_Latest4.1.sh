#!/bin/bash

#Video Poker Vice Card Game Linux CLI
#Version:4.1
#Author:LexT
#Date:05/25/2023


LOSE='\033[0;31m'
REGULAR='\033[0;0m'
WIN='\033[0;32m'
POINTS='\033[0;33m'
URBAN='\033[0;33m'
TITLE='\033[0;35m'

D='\033[0;34m\033[107m'
C='\033[0;32m\033[107m'
S='\033[0;97m\033[107m'
H='\033[0;31m\033[107m'


myCards=("01C" "01D" "01H" "01S" "02C" "02D" "02H" "02S" "03C" "03D" "03H" "03S" "04C" "04D" "04H" "04S" "05C" "05D" "05H" "05S" "06C" "06D" "06H" "06S" "07C" "07D" "07H" "07S" "08C" "08D" "08H" "08S" "09C" "09D" "09H" "09S" "10C" "10D" "10H" "10S" "11C" "11D" "11H" "11S" "12C" "12D" "12H" "12S" "13C" "13D" "13H" "13S")
myFaces=("01" "01" "01" "01" "02" "02" "02" "02" "03" "03" "03" "03" "04" "04" "04" "04" "05" "05" "05" "05" "06" "06" "06" "06" "07" "07" "07" "07" "08" "08" "08" "08" "09" "09" "09" "09" "10" "10" "10" "10" "11" "11" "11" "11" "12" "12" "12" "12" "13" "13" "13" "13")
mySuits=("C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S" "C" "D" "H" "S")
mySymbols=("\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660" "\u2663" "\u2666" "\u2665" "\u2660")
myValues=("14" "14" "14" "14" "02" "02" "02" "02" "03" "03" "03" "03" "04" "04" "04" "04" "05" "05" "05" "05" "06" "06" "06" "06" "07" "07" "07" "07" "08" "08" "08" "08" "09" "09" "09" "09" "10" "10" "10" "10" "11" "11" "11" "11" "12" "12" "12" "12" "13" "13" "13" "13")

myPair=0
myTwoPair=0
myThreeOfAKind=0
myFlush=0
myStraight=0
myFullHouse=0
myFourOfAKind=0
myStraightFlush=0
myRoyalFlush=0
alreadywon=0

RANDOM=$$$(date +%s)

playerPoints=1000
totalNumberWins=0
totalPointsWon=0
currentWin='Game Over'
cardComp1=''
cardComp2=''
cardComp3=''
cardComp4=''
cardComp5=''
suitComp1=''
suitComp2=''
suitComp3=''
suitComp4=''
suitComp5=''
Games=1



while true

do

printf "\033c"
echo " "
echo -e "${TITLE}Welcome To Video Poker Vice for Linux CLI${REGULAR}"
echo -e ""
echo -e "${URBAN}Features${REGULAR}"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Card Decks: 1 (Standard 52)"
echo "Tokens per Play: 5"
echo "Hold Two First Cards (Example): 11000"
echo "Auto-deal: enabled"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " "
echo -e "${URBAN}Options${REGULAR} (default: Draw All Cards)"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "q: Quit"
echo "1: Hold Card"
echo "0: Draw Card"
echo "Enter: Accept"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " " 
echo -e "${URBAN}Rewards${REGULAR}"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Two Pair: 30"
echo "Three of a Kind: 50"
echo "Straight: 70"
echo "Flush: 100"
echo "Full House: 200"
echo "Four of a Kind: 300"
echo "Straight Flush: 400"
echo "Royal Flush: 500"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " "


Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done

echo -e "Credit:${POINTS}$playerPoints${REGULAR} Earnings:${POINTS}$totalPointsWon${REGULAR} Wins:${POINTS}$totalNumberWins${REGULAR} Round:${POINTS}$Games${REGULAR}"
echo " "
echo " "

echo -e "${LOSE}$currentWin"
echo -e "${REGULAR}"
echo " "


echo -e "${URBAN}     ${REGULAR} ${!mySuits[$Reel1]}\033[40m\e[1m${myFaces[$Reel1]}${mySymbols[$Reel1]}\033[49m  ${!mySuits[$Reel2]}\033[40m\e[1m${myFaces[$Reel2]}${mySymbols[$Reel2]}\033[49m  ${!mySuits[$Reel3]}\033[40m\e[1m${myFaces[$Reel3]}${mySymbols[$Reel3]}\033[49m  ${!mySuits[$Reel4]}\033[40m\e[1m${myFaces[$Reel4]}${mySymbols[$Reel4]}\033[49m  ${!mySuits[$Reel5]}\033[40m\e[1m${myFaces[$Reel5]}${mySymbols[$Reel5]}\033[49m 
 ${REGULAR}\033[49m\e[0m "
echo -e " " 

read -p $'Which to \033[0;32mHold\033[0;0m? ' response
printf "\033c"
echo " "

if [[ $response = "10000" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "11000" ]];then
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "11100" ]];then
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "11110" ]];then
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "01000" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "01100" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "00110" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi


if [[ $response = "01110" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "01111" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "00100" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "00110" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "00111" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "00011" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
done
fi
if [[ $response = "00001" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10001" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "11001" ]];then
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10011" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10101" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "01001" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10010" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10100" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "01010" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "00101" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi


if [[ $response = "10010" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "01001" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "00111" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "11010" ]];then
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "01011" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "10110" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "01101" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi


if [[ $response = "10111" ]];then
Reel2=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel2=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "11101" ]];then
Reel4=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel4=$[$RANDOM % ${#myCards[@]}]
done
fi

if [[ $response = "11011" ]];then
Reel3=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel3=$[$RANDOM % ${#myCards[@]}]
done
fi



if [[ $response = "q" ]];then
exit
fi

if [[ $response = "" ]];then
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
while [ $Reel1 == $Reel2 ] || [ $Reel3 == $Reel2 ] || [ $Reel3 == $Reel1 ] || [ $Reel4 == $Reel3 ] || [ $Reel4 == $Reel2 ] || [ $Reel4 == $Reel1 ] || [ $Reel5 == $Reel4 ] || [ $Reel5 == $Reel3 ] || [ $Reel5 == $Reel2 ] || [ $Reel5 == $Reel1 ]
do 
Reel1=$[$RANDOM % ${#myCards[@]}]
Reel2=$[$RANDOM % ${#myCards[@]}]
Reel3=$[$RANDOM % ${#myCards[@]}]
Reel4=$[$RANDOM % ${#myCards[@]}]
Reel5=$[$RANDOM % ${#myCards[@]}]
done
fi




cardComp1=${myValues[$Reel1]}
cardComp2=${myValues[$Reel2]}
cardComp3=${myValues[$Reel3]}
cardComp4=${myValues[$Reel4]}
cardComp5=${myValues[$Reel5]}
suitComp1=${mySuits[$Reel1]}
suitComp2=${mySuits[$Reel2]}
suitComp3=${mySuits[$Reel3]}
suitComp4=${mySuits[$Reel4]}
suitComp5=${mySuits[$Reel5]}

#Start with Bet
currentWin="${LOSE}Game Over"
playerPoints=$(($playerPoints-5))




cardArray=()

cardArray+=($cardComp1)
cardArray+=($cardComp2)
cardArray+=($cardComp3)
cardArray+=($cardComp4)
cardArray+=($cardComp5)

#Bubble Sort

for ((i = 0; i<5; i++))
do
for ((j = 0; j<5-i-1; j++))
do
if [ ${cardArray[j]} -gt ${cardArray[$((j+1))]} ]
then
temp=${cardArray[j]}
cardArray[$j]=${cardArray[$((j+1))]}
cardArray[$((j+1))]=$temp
fi
done
done

#Two Pair
if [[ ${cardArray[0]} = ${cardArray[1]} && ${cardArray[2]} = ${cardArray[3]} ]];then
currentWin="${WIN}Win!!! Two Pair"
myTwoPair=1
fi
if [[ ${cardArray[1]} = ${cardArray[2]} && ${cardArray[3]} = ${cardArray[4]} ]];then
currentWin="${WIN}Win!!! Two Pair"
myTwoPair=1
fi
if [[ ${cardArray[0]} = ${cardArray[1]} && ${cardArray[3]} = ${cardArray[4]} ]];then
currentWin="${WIN}Win!!! Two Pair"
myTwoPair=1
fi
#Three of a Kind
if [[ ${cardArray[0]} = ${cardArray[1]} && ${cardArray[1]} = ${cardArray[2]} ]];then
currentWin="${WIN}Win!!! Three of a Kind"
myThreeOfAKind=1
fi
if [[ ${cardArray[1]} = ${cardArray[2]} && ${cardArray[2]} = ${cardArray[3]} ]];then
currentWin="${WIN}Win!!! Three of a Kind"
myThreeOfAKind=1
fi
if [[ ${cardArray[2]} = ${cardArray[3]} && ${cardArray[3]} = ${cardArray[4]} ]];then
currentWin="${WIN}Win!!! Three of a Kind"
myThreeOfAKind=1
fi
#Four of a Kind
if [[ ${cardArray[0]} = ${cardArray[1]} && ${cardArray[1]} = ${cardArray[2]} && ${cardArray[2]} = ${cardArray[3]} ]];then
currentWin="${WIN}Win!!! Four of a Kind"
myFourOfAKind=1
fi
if [[ ${cardArray[1]} = ${cardArray[2]} && ${cardArray[2]} = ${cardArray[3]} && ${cardArray[3]} = ${cardArray[4]} ]];then
currentWin="${WIN}Win!!! Four of a Kind"
myFourOfAKind=1
fi
#Flush
if [[ $suitComp1 = $suitComp2 && $suitComp2 = $suitComp3 && $suitComp3 = $suitComp4 && $suitComp4 = $suitComp5 ]];then
currentWin="${WIN}Win!!! Flush"
myFlush=1
fi
#Straight
if [[ ${cardArray[0]}+1 = ${cardArray[1]} && ${cardArray[1]}+1 = ${cardArray[2]} && ${cardArray[2]}+1 = ${cardArray[3]} && ${cardArray[3]}+1 = ${cardArray[4]} ]];then
currentWin="${WIN}Win!!! Straight"
myStraight=1
fi
#StraightFlush
if [[ $myFlush = 1 && $myStraight = 1 ]];then
currentWin="${WIN}Win!!! Straight Flush"
myStraightFlush=1
fi
#RoyalFlush
if [[ $myFlush = 1 && $myStraight = 1 && ${cardArray[4]} == 14 ]];then
currentWin="${WIN}Win!!! Royal Flush"
myRoyalFlush=1
fi
#end of combos

if [[ $myRoyalFlush = 1 ]];then
playerPoints=$(($playerPoints+500))
totalPointsWon=$(($totalPointsWon+500))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myStraightFlush = 1 ]];then
playerPoints=$(($playerPoints+400))
totalPointsWon=$(($totalPointsWon+400))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myFourOfAKind = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+300))
totalPointsWon=$(($totalPointsWon+300))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myFullHouse = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+200))
totalPointsWon=$(($totalPointsWon+200))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myFlush = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+100))
totalPointsWon=$(($totalPointsWon+100))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myStraight = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+70))
totalPointsWon=$(($totalPointsWon+70))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myThreeOfAKind = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+50))
totalPointsWon=$(($totalPointsWon+50))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi
if [[ $myTwoPair = 1 && $alreadywon = 0 ]];then
playerPoints=$(($playerPoints+30))
totalPointsWon=$(($totalPointsWon+30))
totalNumberWins=$(($totalNumberWins+1))
alreadywon=1
fi

echo " "
echo -e "${TITLE}Welcome To Video Poker Vice for Linux CLI${REGULAR}"
echo -e ""
echo -e "${URBAN}Features${REGULAR}"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Card Decks: 1 (Standard 52)"
echo "Tokens per Play: 5"
echo "Hold Two First Cards (Example): 11000"
echo "Auto-deal: enabled"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " "
echo -e "${URBAN}Options${REGULAR} (default: Draw All Cards)"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "q: Quit"
echo "1: Hold Card"
echo "0: Draw Card"
echo "Enter: Accept"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " " 
echo -e "${URBAN}Rewards${REGULAR}"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Two Pair: 30"
echo "Three of a Kind: 50"
echo "Straight: 70"
echo "Flush: 100"
echo "Full House: 200"
echo "Four of a Kind: 300"
echo "Straight Flush: 400"
echo "Royal Flush: 500"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo " "

echo -e "Credit:${POINTS}$playerPoints${REGULAR} Earnings:${POINTS}$totalPointsWon${REGULAR} Wins:${POINTS}$totalNumberWins${REGULAR} Round:${POINTS}$Games${REGULAR}"
echo " "
echo " "

echo -e "${LOSE}$currentWin"
echo -e "${REGULAR}"
echo " "

#echo -e " ${cardArray[0]}  ${cardArray[1]}   ${cardArray[2]}   ${cardArray[3]}   ${cardArray[4]} "
echo -e "${URBAN}     ${REGULAR} ${!mySuits[$Reel1]}\033[40m\e[1m${myFaces[$Reel1]}${mySymbols[$Reel1]}\033[49m  ${!mySuits[$Reel2]}\033[40m\e[1m${myFaces[$Reel2]}${mySymbols[$Reel2]}\033[49m  ${!mySuits[$Reel3]}\033[40m\e[1m${myFaces[$Reel3]}${mySymbols[$Reel3]}\033[49m  ${!mySuits[$Reel4]}\033[40m\e[1m${myFaces[$Reel4]}${mySymbols[$Reel4]}\033[49m  ${!mySuits[$Reel5]}\033[40m\e[1m${myFaces[$Reel5]}${mySymbols[$Reel5]}\033[49m 
 ${REGULAR}\033[49m\e[0m "
echo -e " " 

i=0
while [ $i -le 5 ]; do
  for s in / - \\ \|; do
    printf "\r$s"
    sleep .1
  done
  i=$((i+1))
done

if [[ $deal = "q" ]];then
exit
fi
Games=$((Games+1))
currentWin='Game Over'
printf "\033c"
myPair=0
myTwoPair=0
myThreeOfAKind=0
myFlush=0
myStraight=0
myFullHouse=0
myFourOfAKind=0
myStraightFlush=0
myRoyalFlush=0
alreadywon=0
done

