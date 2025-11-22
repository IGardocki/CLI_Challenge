#!/bin/bash
INPUT_FILE="orca.txt"
OUTPUT_FILE="decodedOrca.txt"

if [ "$SQ_CC" != "Adrian" ]; then
    echo "Whoa, that's not the Sq CC! Please set the SQ_CC equal to Adrian (for this command only) to run this script!"
    exit 1
fi

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    exit 1
fi

echo "Decoding '$INPUT_FILE' (Shift -3) to '$OUTPUT_FILE'..."
tr 'A-Za-z' 'X-ZA-Wx-za-w' < "$INPUT_FILE" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully decoded content written to '$OUTPUT_FILE'."
else
    echo "An error occurred during decoding."
fi

exit 0