#!/bin/bash

# Execution: bash adventofcode_1.sh adventofcode_1_input.txt

# Check file input
 
sh ../check_input.sh $1

#
filename=$1

red=2
green=13
blue=14

function seperate_string_by_colon {
	IFS=: read -r game game_results <<< "$1"
	#echo "$game"
	#echo "$results"
}

while read -r line; do 
	seperate_string_by_colon "$line"
	IFS=';' read -ra runs <<< "$game_results"
	for run in "${runs[@]}"; do
		IFS=',' read -ra cubes <<< "$run"
  		for cube in "${cubes[@]}"; do 
  			IFS=' ' read -r number color <<< "$cube"
  			#echo "$color"
  			for i in "${!color[@]}"; do
  				case $color in
  					red)
  						if [[ "$number" -gt "$red" ]]
  						then 
  							echo $game
  							continue 3
  						fi 
  						;;
  					green)
  						if [[ "$number" -gt "$green" ]]
  						then 
  							echo $game
  							continue 3
  						fi 
  						;;
  					blue)
  						if [[ "$number" -gt "$blue" ]]
  						then 
  							echo $game
  							continue 3
  						fi 
  						;;
  				esac
  			done
  			
  		done
	done
done < "$filename" 
