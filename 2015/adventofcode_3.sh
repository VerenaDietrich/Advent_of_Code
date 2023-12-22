#!/bin/bash

# Überprüfen, ob eine Datei als Argument übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Wrong number of arguemnts" #Usage: $0 <filename>"
    exit 1
fi

# Dateiname aus dem Argument speichern
filename=$1

# Überprüfen, ob die Datei existiert
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Definiere die Funktionen der Bewegung
position_x=0
position_y=0


function move_to_next_house {
	case $1 in
	
	"^")
		position_y=$((position_y + 1))
		;;
	
	"v")
		position_y=$((position_y - 1))
		;;
		
	">")
		position_x=$((position_x + 1))
		;;
		
	"<")
		position_x=$((position_x - 1))
		;;
	*)
		echo "The character $1 is not allowed as input"
		exit
	
esac	
}
echo "Santa starts at the house with postion $position_x $position_y"
read -r line < "$filename"
history_house=0,0$'\n'
for (( i=0; i<${#line}; i++ )); do
	char="${line:$i:1}"
	move_to_next_house $char
	#echo "Santa is at the house with postion $position_x $position_y"
	history_house="$history_house$position_x,"
	history_house="${history_house}${position_y}"$'\n'
done

#echo $history_house
unique_houses=$(echo -e "$history_house" | sort | uniq | wc -l)
echo "Santa has been in $unique_houses unique houses."















