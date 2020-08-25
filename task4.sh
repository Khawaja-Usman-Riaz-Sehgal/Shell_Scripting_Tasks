#!/bin/bash


echo
echo "Task is to create a script that creates a backup ( in /home/) of all .c files present in a directory  (given by user as a command line argument)"
echo "Create a backup directory if it doesn't exist."
echo "If it exist:"
echo "If there have been changes to the file since the last backup, then copy the current .c file to the backup directory and print a message that the file has been updated"
echo "Else (if no copy exists in the backup directory) copy it and print a message that the file had no previous copy and is now backed up"
echo "(Otherwise, no copy will be made)"
echo


source_dir=$1
destination_dir=~/backup_dir
if [ -d $destination_dir ]; then
    echo "$destination_dir exists."
else
    echo "$destination_dir does not exist."
    mkdir $destination_dir
    echo "$destination_dir has been successfully created."
fi
c_files=$(ls $1/*.c | xargs basename -s *.c \ )
backup_c_files=$(ls $destination_dir | xargs basename -s *.c \ )
for file in $c_files
do
if [ -e "$destination_dir/$file" ]
then
   if cmp -s "$1/$file" "$destination_dir/$file"
   then
      echo "$file is unchanged"
   else
      echo "the $file has been updated"
      cp $1/$file $destination_dir
   fi
else
   cp $1/$file $destination_dir
   echo "the $file had no previous copy and is now backed up"
fi
done

