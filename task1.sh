#!/bin/bash

echo "Find a specific pattern in a file in a directory hierarchy"
echo "print all lines matching a particular pattern in matching files with their line number and their file name "
echo "save the data in a file"


cd /home/emumba/Documents/ 
grep "include" -n * > ~/lsl.txt
cat ~/lsl.txt
