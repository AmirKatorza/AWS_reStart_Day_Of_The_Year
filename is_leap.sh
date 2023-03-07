#! /bin/bash

function is_leap() {

    re='^[0-9]{4}$'
    flag=0
    while [ $flag -eq 0 ]
    do
        read -p "Enter year (YYYY): " year
        if [[ $year =~ $re ]]; 
        then
            flag=1
        else
            echo "Error: Not a valid number, try again!" 
        fi
    done

    a=$(( $year % 4 )) 
    b=$(( $year % 100 ))
    c=$(( $year % 400 ))
    if [[ $a -eq 0 && $b -ne 0 || $c -eq 0 ]];
    then 
        echo "$year is leap year"
    else
        echo "$year is not a leap year"
    fi
}

is_leap
