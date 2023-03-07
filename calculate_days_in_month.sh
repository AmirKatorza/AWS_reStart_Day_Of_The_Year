#!/bin/bash
#The function gets a month number between 1-12 and returns the number of days in this month
#The function also gets a number 1 or 0
#regular_year=1 (if equals to zero-0 then leap year)
#usage:
#days_in_month $month (1-12)
#make sure to differentiate between leap year months and regular year months.
read -p "enter a month  " month 
read -p "enter a year  " year


function days_in_month()  
  {
   
     
    case $month in
        1|3|5|7|8|10|12)
            echo 31
            ;;
        4|6|9|11)
            echo 30
            ;;
        2)
        isleap=$(leap_year year )
         if  [[$isleap  -eq 1 ]]       then
                echo 29
        else
                echo 28
        fi
            ;;
        *)
            echo "Invalid month: $month"
            ;;
    esac
}
days_in_month month year

