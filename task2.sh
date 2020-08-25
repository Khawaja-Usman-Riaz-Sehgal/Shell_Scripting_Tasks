#!/bin/bash

echo
echo "CSV is a simple file format used to store tabular data, such as a spreadsheet or database."
echo "Print a data from specific row and column Given by user as a command line argument."
echo

cat task2.csv
echo

#echo "Write specific row from 1-3"
#read row
row=$1
while [ "$row" -gt 3 ] || [ "$row" -lt 1 ]; do
   echo "You enter the wrong row!"
   echo "Write Specific row from 1-3"
   read row
done
#echo "Write Specific column from 1-10"
#read col
col=$2
while [ "$col" -gt 10 ] || [ "$col" -lt 1 ]; do
   echo "You enter the wrong column!"
   echo "Write Specific column from 1-10"
   read col
done

echo
echo | awk -v row="$row" -v col="$col" 'NR==row { print $col }' task2.csv
echo
