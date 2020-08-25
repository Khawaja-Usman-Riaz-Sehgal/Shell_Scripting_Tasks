#!/bin/bash

echo "List all files on terminal with sorted on size of file. (Hint: Read ls, sort and pipeline)"
echo

ls -l / | sort -nk5
