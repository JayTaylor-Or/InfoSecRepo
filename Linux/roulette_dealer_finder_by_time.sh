#!/bin/bash


#awk '{print$1,$2,$5,$6}' <schedule_file> | grep -i "TIME" <schedule_file> | awk '{print$1,$2,$5,$6}' 

#Example below. \/\/\/ ... Fill in "Time" and the 2 <schedule_files> above /\/\/\ ...un(#) b4 run

awk '{print$1,$2,$5,$6}' 0310_Dealer_schedule | grep -i "8:00:00 AM" 0310_Dealer_schedule | awk '{print$1,$2,$5,$6}'

