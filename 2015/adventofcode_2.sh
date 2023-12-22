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

# Berechnen, wieviel Geschenkpapier gebraucht wird

function min_number {
    printf "%s\n" "$@" | sort -g | head -n1
}

function two_samlles_numbers {
    printf "%s\n" "$@" | sort -g | head -n2
}

function compute_wrapping_paper_one_gift {
	local wrapping_paper_one_gift
	# Summieren über alle Flächeninhalte
	wrapping_paper_one_gift=$((2 * $1 * $2 + 2 * $1 * $3 + 2 * $2 * $3))
	# Addieren der kleinsten Seite
	min_site=$(min_number $(($1 * $2)) $(($1 * $3)) $(($2 * $3)))
	wrapping_paper_one_gift=$((wrapping_paper_one_gift+min_site))
	echo $wrapping_paper_one_gift
}

function compute_ribbon_one_gift {
	# Ribbon
	shortest_sites=$(two_samlles_numbers $1 $2 $3)
	read -r -d "-" num1 num2 <<< "$shortest_sites"
	ribbon_one_gift=$(($num1 + $num1 + $num2 + $num2)) 
	# Addiere die Schleife
	bow_one_gift=$(($1 * $2 * $3))
	ribbon_one_gift=$((ribbon_one_gift+bow_one_gift))
	echo $ribbon_one_gift #$bow_one_gift
}


wrapping_paper_sum=0 
ribbon_sum=0
while IFS= read -r line; do
	IFS=x read -r l w h <<< $line
	wrapping_paper=$(compute_wrapping_paper_one_gift $l $w $h)
	wrapping_paper_sum=$((wrapping_paper_sum + wrapping_paper))
	ribbon=$(compute_ribbon_one_gift $l $w $h)
	ribbon_sum=$((ribbon_sum+ribbon))
done < "$filename"
echo "The elfs need to order $wrapping_paper_sum square feet of wrapping paper."
echo "The elfs need to order $ribbon_sum feet of ribbon."



