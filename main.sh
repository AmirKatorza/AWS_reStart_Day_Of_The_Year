#! /bin/bash

source aux_functions.sh

option=999

while [ "$option" -ne "0" ];
do
        echo -e "Choose your option:\n1 - Day of the year\n2 - Days in month\n3 - Is leap year\n0 - Exit"
        read option     
        if [ $option -eq 1 ];
        then
                read -p "Please enter a date (YYYY) (MM) (DD): " year month day
                year_valid=$(chk_year $year)
                month_valid=$(chk_month $month)
                if [[ $year_valid -eq 1 && $month_valid -eq 1 ]];
                then
                    day_valid=$(chk_day $year $month $day)
                    if [[ $day_valid -eq 1 ]];
                    then
                        day_in_year=$(day_of_year $year $month $day)
                        echo "Result: $day_in_year"
                    else
                        echo "Not a valid input please try again!"
                    fi
                else
                    echo "No a valid input please try again!"
                fi
        elif [ $option -eq 2 ];
        then
                read -p "Please enter year (YYYY) (MM): " year month
                year_valid=$(chk_year $year)
                month_valid=$(chk_month $month)
                if [[ $year_valid -eq 1 && $month_valid -eq 1 ]];
                then
                    num_days_in_month=$(days_in_month $year $month)
                    echo "Result: $num_days_in_month"
                else
                    echo "Not a valid input please try again!"
                fi
                
        elif [ $option -eq 3 ];
        then
                read -p "Please enter year (YYYY): " year
                year_valid=$(chk_year $year)
                if [[ $year_valid -eq 1 ]];
                then
                    is_leap_year=$(leap_year $year)
                    if [ $is_leap_year -eq 1 ]
                    then
                        echo "Year: $year is leap year"
                    else
                        echo "Year: $year is regular year"
                    fi
                else
                    echo "Not a valid input please try again!"
                fi
        elif [ $option -eq 0 ];
        then
                echo "Exiting Bye Bye!" 
        else
                echo "Not a valid number"
        fi
done
