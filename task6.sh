#!/bin/bash

echo
echo "The file raw_data_for_stats_calculation.txt contains 200 entries of data from a test. Extract the number from each line and store the list of numbers in a separate file."
echo "Sort these numbers and store the sorted list in a separate file"
echo "Use the sorted list to find:"
echo "Median"
echo "Mean"
echo "Sum"
echo "Minimum"
echo "Maximum (edited)"
echo




cut -b 18-20 extra.txt>unsorted.txt
sort unsorted.txt>sorted.txt
wc -l < sorted.txt > /dev/null 2>&1

cat sorted.txt -n
echo "------------Median------------------"
if [ `expr $(wc -l < sorted.txt) % 2` == 0 ]
then
   med=`expr $(wc -l < sorted.txt) - 1`
   median=`expr $med / 2`
   median2=`expr $(wc -l < sorted.txt) / 2`
   echo "median: "
   awk -v var=$median '{if(NR==var) print $0}' sorted.txt
   echo "median2: "
   awk -v var2=$median '{if(NR==var2) print $0}' sorted.txt
else
   med=`expr $(wc -l < sorted.txt) - 1`
   median=`expr $med / 2`
   echo "median: "
   awk -v var=$median '{if(NR==var) print $0}' sorted.txt
fi

echo "--------------Minimum-------------------"

awk 'END { print min }
{ 
  min || min = $1
  $1 < min && min = NR
  }' sorted.txt

echo "--------------Maximum--------------------"
awk -F'#' -v max=0 '{if($1>max){content=$0; max=$1}}END{print content}' sorted.txt

echo "---------------Sum-----------------------"
awk '{ sum += $1 } END { print sum }' sorted.txt

echo "--------------Mean-----------------------"

mean=`expr $(awk '{ sum += $1 } END { print sum }' sorted.txt) / $(wc -l < sorted.txt)`
echo $mean
