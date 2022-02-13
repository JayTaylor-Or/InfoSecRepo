#!/bin/bash

states=(Oregon Washington Idaho California)

for state in ${states[@]};
do
  if [ $state == 'Oregon' ]
  then
     echo "Oregon is the best"
  else 
     echo "Oregon is not for me"
  fi

done

