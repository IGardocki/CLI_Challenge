#!/bin/bash

# Script to decode a file encoded with a Caesar cipher (shift = +3)
# Input file: orca.txt
# Output file: decodedOrca.txt

INPUT_FILE="orca.txt"
OUTPUT_FILE="decodedOrca.txt"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    exit 1
fi

echo "Decoding '$INPUT_FILE' (Shift -3) to '$OUTPUT_FILE'..."

# The 'tr' command performs the substitution.
# The original alphabet (A-Z) is mapped to the alphabet shifted back by 3 (X-Z followed by A-W).
#
# Encoded (Input set): A B C D E F ... Z
# Decoded (Output set): X Y Z A B C ... W
#
# The output set is constructed as: X-Z (the end of the alphabet) followed by A-W.

tr 'A-Za-z' 'X-ZA-Wx-za-w' < "$INPUT_FILE" > "$OUTPUT_FILE"

# Check if the translation was successful
if [ $? -eq 0 ]; then
    echo "Successfully decoded content written to '$OUTPUT_FILE'."
else
    echo "An error occurred during decoding."
fi

exit 0