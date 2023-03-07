#!/bin/bash

#the function gets three numbers (year, month,day)
#and returns the n(th) day in the year.

#make sure to check input validation

#usage:
#day_of_year $year $month $day
read -p "enter a day  DD " day
read -p "enter a month  MM " month 
read -p "enter a year YYYY " year


function day_of_year() {
    isleap=$(leap_year year )
    if [[ isleap -ep 1 ]]
    then
        echo 366
    else 
        echo 365
    fi    

    


}
day_of_year