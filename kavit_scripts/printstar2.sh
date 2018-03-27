#!/bin/bash

CHAR="*"
NUM_LINE=5

# Pattern One
# *
# **
# ***
# ****
# *****


# Pattern Two
#     *
#    **
#   ***
#  ****
# *****
function printStarRowPatternOne() {
        ROW_NUM=$1
        for (( column=1;column<=ROW_NUM;column++ ))
        do
                #echo "Printing stars for row ${row}"
                echo -n "$CHAR"
        done
        echo ""
}

function printStarRowPatternTwo() {
        ROW_NUM=$1
        NUM_LINE=$2
        for (( column=1;column<=(NUM_LINE-ROW_NUM);column++ ))
        do
                #echo "Printing stars for row ${row}"
                echo -n " "
        done
        printStarRowPatternOne ${ROW_NUM}
}

function printStar() {
        CHAR=$1
        NUM_LINE=$2
        echo "I'll print star with ${CHAR} having ${NUM_LINE} lines"
        for (( row=1;row<=NUM_LINE;row++ ))
        do
                #echo "Printing stars for row ${row}"
                printStarRowPatternTwo ${row} ${NUM_LINE}
        done
}

printStar "${CHAR}" "${NUM_LINE}"


function printStarRowPatternOn() {
        ROW_NUM=$1
        for (( column=5;column=>ROW_NUM;column-- ))
        do
                #echo "Printing stars for row ${row}"
                echo -n "$CHAR"
        done
        echo ""
}

function printStarRowPatternTw() {
        ROW_NUM=$1
        NUM_LINE=$2
        for (( column=5;column=>(NUM_LINE-ROW_NUM);column-- ))
        do
                #echo "Printing stars for row ${row}"
                echo -n " "
        done
        printStarRowPatternOn ${ROW_NUM}
}

function printStarr() {
        CHAR=$1
        NUM_LINE=$2
        echo "I'll print star with ${CHAR} having ${NUM_LINE} lines"
        for (( row=1;row<=NUM_LINE;row++ ))
        do
                #echo "Printing stars for row ${row}"
                printStarRowPatternTw ${row} ${NUM_LINE}
        done
}



printStarr "${CHAR}" "${NUM_LINE}"
