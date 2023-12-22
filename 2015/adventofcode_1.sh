#!/bin/bash

# Execution: bash adventofcode_1.sh adventofcode_1_input.txt

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

# Zählen der Vorkommnisse des Zeichens '('
count_open=$(grep -o '(' "$filename" | wc -l)
count_close=$(grep -o ')' "$filename" | wc -l)

# Ausgabe der Anzahl
echo "Number of '(' in File '$filename': $count_open"
echo "Number of ')' in File '$filename': $count_close"
echo "The instruction takes Santa to floor $(($count_open - $count_close))"

# Dokumentation der aktuellen Ebene
read -r line < "$filename"
floor=0
for (( i=0; i<${#line}; i++ )); do
	echo "After $i steps, Santa is on floor $floor"
	char="${line:$i:1}"
	if [ $char = '(' ]; then
		floor=$((floor + 1))
	elif [ $char = ')' ]; then
		floor=$((floor - 1))
	else
		echo "Undefined character"
		exit
	fi 
	if [ $floor = -1 ]; then
		echo "Santa has reached his destination (basement; floor: $floor) after $((i+1)) steps"
		exit 
	fi	
		
done
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
