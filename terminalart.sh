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

# Varables
REFRESH=.001
BACKGROUND=${ColorArray[0]}
OBJCOLOR=${ColorArray[12]}
LOOPS=0 # How many times the screen with refresh
# Detect and set terminal size
WIDTH=$(tput cols)
HEIGHT=$(tput lines)
#draw square
SquareWidth=4
SquareHeight=4
#Where to draw square
DrawObjX=4
((DrawObjY=($HEIGHT/2)-($SquareHeight/2)))  #Centers the height

# DRAW SQUARE ON SCREEN FUNCTION
draw_screen () {
    for (( x = 0; x <= $LOOPS; x +=2 )) {
        #ROWS
        for ((j = 0; j < $HEIGHT; j += 1 )) {
            #LINE
            for ((i = 0; i < $WIDTH; i += 1 )) {
                if [[ i -ge $DrawObjX && i -lt $DrawObjX+$SquareWidth && j -ge $DrawObjY && j -lt $DrawObjY+$SquareHeight ]]; then
                    printf "$OBJCOLOR*"
                else            
                    #Back
                    printf "$BACKGROUND*"
                fi
            }
        sleep $REFRESH
        printf "\n"
        }

    }
}
#Main Loop

for (( y = 0; y < $WIDTH; y += 2 )) {
    clear 
    draw_screen
    #Movement
    ((DrawObjX+=2))
}

## Reset terminal color
printf "${ColorArray[15]} END OF LINE...\n"
