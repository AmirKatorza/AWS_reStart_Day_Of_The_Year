#!/bin/bash

function leap_year() {
    local in_year=$1
    if (( $in_year % 4 == 0 && $in_year % 100 != 0 )) || (( $in_year % 400 == 0 )); 
    then
        echo "1" # True
    else
        echo "0" # False
    fi
}

#The function gets a month number between 1-12 and returns the number of days in this month
#The function also gets a number 1 or 0
#regular_year=1 (if equals to zero-0 then leap year)
#usage:
#days_in_month $month (1-12)
#make sure to differentiate between leap year months and regular year months.

function days_in_month() {
   local in_year=$1
   local in_month=$2     
   case $month in
    1|3|5|7|8|10|12)
            echo "31" ;;
    4|6|9|11)
            echo "30" ;;
        2)
        is_leap=$(leap_year $in_year)
        if [[ $is_leap  -eq 1 ]] 
        then
            echo "29"
        else
            echo "28"
        fi ;;
    esac
}

#the function gets three numbers (year, month,day)
#and returns the n(th) day in the year.
#usage:
#day_of_year $year $month $day

function day_of_year() {

    local in_year=$1
    local in_month=$2
    local in_day=$3
    local day_of_year=0
    for (( i=1; i<$in_month; i++))
    do
        num_of_days_month=$(days_in_month $in_year $i)
        day_of_year=$(( $day_of_year + $num_of_days_month ))
    done
    day_of_year=$(( $day_of_year + $in_day ))
    echo "$day_of_year"
}

