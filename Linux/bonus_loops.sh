#!/bin/bash
nums=$(echo {0..9})
for num in ${nums[@]};
do
  new_num=$(($num + 2))
  echo $new_num


done
