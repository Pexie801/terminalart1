#!/bin/bash
#Termainl Art1
#Author Pexie
# @_Pexie twitter
#July 2021
#DC801 & 801Labs

### Colors
#EXAMPLE: printf "${RED}HACK THE PLANET!\n"
ColorArray[0]='\033[0;30m'  #Black
ColorArray[1]='\033[1;30m'  #DGrey
ColorArray[2]='\033[0;31m'  #Red
ColorArray[3]='\033[1;31m'  #LRed
ColorArray[4]='\033[0;32m'  #Green
ColorArray[5]='\033[1;32m'  #Lgreen
ColorArray[6]='\033[0;33m'  #Brown
ColorArray[7]='\033[1;33m'  #Yellow
ColorArray[8]='\033[0;34m'  #Blue
ColorArray[9]='\033[1;34m'  #LBlue
ColorArray[10]='\033[0;35m' #Purple
ColorArray[11]='\033[1;35m' #LPurple
ColorArray[12]='\033[0;36m' #Cyan
ColorArray[13]='\033[1;36m' #LCyan
ColorArray[14]='\033[0;37m' #Lgrey
ColorArray[15]='\033[1;37m' #White

### Detect terminal size
WIDTH=$(tput cols)
HEIGHT=$(tput lines)

LOOPS=6


#draw square
SQUARE[0]=2
SQUARE[1]=2

DrawObjX=16
DrawObjY=16

### Main Code ###
#Loop Test

## Clear Screen
echo "clear"

for (( x = 4; x <= $LOOPS; x +=2 )) {

    #ROWS
    for ((j = 0; j < $HEIGHT; j += 1 )) {
        #LINE
        for ((i = 0; i < $WIDTH; i += 1 )) {
            if [[ i -eq $DrawObjX && j -eq $DrawObjY ]]; then                
                printf "${ColorArray[2]}*"
                if [[ $DrawObjX <  ]]
            else            
                #Prints Base Color BLUE
                printf "${ColorArray[8]}*"
            fi
        }
    sleep .02
    printf "\n"
    }

}
## Reset terminal color
printf "${ColorArray[15]} END OF LINE...\n"
