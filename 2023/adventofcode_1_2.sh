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

# Declare Array to assoziated array, because of strings (Dictonary, Schlüssel-Wert-Paare)

declare -A digits_written
digits_written[zero]=z0o
digits_written[one]=o1e
digits_written[two]=t2o
digits_written[three]=t3e
digits_written[four]=f4r
digits_written[five]=f5e
digits_written[six]=s6x
digits_written[seven]=s7n
digits_written[eight]=e8t
digits_written[nine]=n9e


# Convert text to digits
function convert_written_digits {
STR=$1
for i in "${!digits_written[@]}"; do
	STR="${STR//"$i"/"${digits_written[$i]}"}"
done
echo $STR
}

# Extract the digits and sum up
sum=0
while read -r line; do 
	line_converted=$(convert_written_digits $line)
	digits=$(echo "$line_converted"| tr -dc '0-9')
	calibration=${digits:0:1}${digits: -1}
	sum=$(( sum + calibration )) 
done < $filename

echo "The total calibration value is $sum"


