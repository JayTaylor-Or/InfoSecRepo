#!/bin/bash
executables=$(find /home -type f -perm 777 2> /dev/null)

for files in ${executables[@]}
do
  echo $files
done
