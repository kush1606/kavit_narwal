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

function printStarRowPatternThree() {
        ROW_NUM=$1
        NUM_LINE=$2
        for (( column=1;column<=ROW_NUM;column++ ))
        do
                #echo "Printing stars for row ${row}"
                echo -n " "
        done
        printStarRowPatternFour ${ROW_NUM} ${NUM_LINE}
}

function printStarRowPatternFour() {
        ROW_NUM=$1
        NUM_LINE=$2
        for (( column=1;column<=(NUM_LINE-ROW_NUM);column++ ))
        do
                #echo "Printing stars for row ${row}"
                echo -n "${CHAR}"
        done
        #printStarRowPatternOne ${ROW_NUM}
}

function printStar() {
	CHAR=$1
	NUM_LINE=$2
	echo "I'll print star with ${CHAR} having ${NUM_LINE} lines"
	for (( row=1;row<=NUM_LINE;row++ ))
	do
		#echo "Printing stars for row ${row}"
		printStarRowPatternTwo ${row} ${NUM_LINE}
		printStarRowPatternOne ${row} ${NUM_LINE}
		echo ""
	done
	for (( row=1;row<=NUM_LINE;row++ ))
        do
                #echo "Printing stars for row ${row}"
                printStarRowPatternThree ${row} ${NUM_LINE}
                printStarRowPatternFour ${row} ${NUM_LINE}
		echo ""
        done

}

printStar "${CHAR}" "${NUM_LINE}"
