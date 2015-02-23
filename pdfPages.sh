#!/bin/bash
totalPages=0
for i in "$@"
do

while read a
do
    pages=`pdfinfo "$a" 2>/dev/null | grep Pages | cut -d ":" -f 2 | tr -d ' '`
    echo "$a: $pages"
    totalPages=$((totalPages+pages))
done <<< "$(find "$i" | egrep -i "*.pdf")"

done
echo "Total pages: $totalPages"
