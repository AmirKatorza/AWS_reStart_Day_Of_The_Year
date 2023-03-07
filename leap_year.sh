#!/bin/bash

leap_year() {
    year=$1
    if (( year % 4 == 0 && year % 100 != 0 )) || (( year % 400 == 0 )); then
        echo "1" # True
    else
        echo "1" # False
    fi
}
# Testing the function
read -p "enter a year  $year"
if leap_year 2023; then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi

