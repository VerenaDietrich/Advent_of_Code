#!/bin/bash

# Execution: bash adventofcode_1.sh adventofcode_1_input.txt

# Check if the number of arguments is as expected
if [ "$#" -ne 1 ]; then
    echo "Wrong number of arguemnts"
    exit 1
fi

# Save filename as variable and check existence
filename=$1
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Extract the digits and sum up
sum=0
while read -r line; do 
	digits=$(echo "$line"| tr -dc '0-9')
	calibration=${digits:0:1}${digits: -1}
	#echo $sum
	#echo $calibration
	sum=$(( sum + calibration )) 
done < $filename

echo "The total calibration value is $sum"
