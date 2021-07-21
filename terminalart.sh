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

#VARABLIES
REFRESH=.05
BACKGROUND=${ColorArray[0]}
OBJCOLOR=${ColorArray[11]}
WIDTH=$(tput cols)      #WIDTH of window (TERMINAL)
HEIGHT=$(tput lines)    #HEIGHT of window (TERMINAL)

#SQUARE DIMENTIONS
SquareWidth=8
SquareHeight=4

#DRAW CURSOR
DrawObjX=0
((DrawObjY=($HEIGHT/2)-($SquareHeight/2)))  #Centers the height

#DRAWS the image in windows (NEW)
draw_canvas () {
    local i j x y line tcount
    clear
    #ROW

    #J is number of ROWS
    #I is place on row

    for ((j = 0; j < $HEIGHT; j += 1)) {
        #COLUMS
        line=()
        for ((i = 0; i < $WIDTH; i += 1)) {
            if [[ i -ge $DrawObjX && i -lt $DrawObjX+$SquareWidth && j -ge $DrawObjY && j -lt $DrawObjY+$SquareHeight ]]; then
              #IF J = DrawObjY
              case $stripCount in
                1-5 ) line+="$color1*"
                  ;;
                6-10 ) line+="$color2*"
                  ;;
                11-15 ) line+="$color3*"
                  ;;
                *) line+="$OBJCOLOR*"
                ;;
              esac
              (($stripCount+=1))
                #line+="$OBJCOLOR*"
            else
                line+="$BACKGROUND*"
            fi
        }
        printf "$line"
    }
}
#DRAW PRIDE FLAG
#DRAW TRANS FLAG
draw_tflag ()
{
    local strips stripCount sizeX sizeY color1 color2 color3
    clear
    color1=${ColorArray[12]}
    color2=${ColorArray[11]}
    color3=${ColorArray[15]}
    strips=5
    stripCount=0
    sizeY=20
    ((stripSize=$sizeY/strips))
    ((sizeX=$sizeY*4))
    SquareWidth=$sizeX
    SquareHeight=$sizeY

    draw_canvas
}

#MAIN BIT RIGHT HERE!!!
for (( y = 0; y <= $WIDTH; y += 2)) {
    clear
    draw_tflag
    ((DrawObjX+=4))
    sleep $REFRESH
}

## Reset terminal color
printf "${ColorArray[15]} END OF LINE...\n"
