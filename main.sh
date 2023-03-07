#! /bin/bash

source aux_functions.sh

function chk_year() {
    local input_year=$1
    local re_year='^[1-9]{4}$'
    if [[ $input_year =~ $re_year ]]; 
    then
        echo "1"
    else
        echo "0"
    fi
}

function chk_month() {
    local input_month=$1
    # local re_month='^[1-9]{2}$'
    if [[ $input_month =~ '^[1-9]{1}$' || $input_month =~ '^[1-9]{2}$' && $input_month -ge 1 && $input_month -le 12 ]];
    then
        echo "1"
    else
        echo "0"
    fi
}

function chk_day() {
    local input_day=$3
    # local re_day='^[1-9]{2}$'
    local number_of_days_in_month=$(days_in_month $1 $2)
    if [[ $input_day =~ '^[1-9]{1}$' || $input_day =~ '^[1-9]{2}$' && $input_day -ge 1 && $input_day -le $number_of_days_in_month ]];
    then    
        echo "1"
    else
        echo "0"
    fi
}

option=999

while [ "$option" -ne "0" ];
do
        echo -e "Choose your option:\n1 - Day of the year\n2 - Days in month\n3 - Is leap year\n0 - Exit"
        read option     
        if [ $option -eq 1 ];
        then
                echo "Please enter a date (YYYY) (MM) (DD)"
                read year month day
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
                        echo "No a valid input please try again!"
                    fi
                else
                    echo "No a valid input please try again!"
                fi
        elif [ $option -eq 2 ];
        then
                echo "Please enter year and month (YYYY) (MM)"
                read year month
                year_valid=$(chk_year $year)
                month_valid=$(chk_month $month)
                if [[ $year_valid -eq 1 && $month_valid -eq 1 ]];
                then
                    num_days_in_month=$(days_in_month $year $month)
                    echo "Result: $num_days_in_month"
                else
                    echo "No a valid input please try again!"
                fi
                #continue
        elif [ $option -eq 3 ];
        then
                echo "Please enter year (YYYY)"
                read year
                year_valid=$(chk_year $year)
                if [[ $year_valid -eq 1 ]];
                then
                    is_leap_year=$(is_leap $year)
                    if [ $is_leap_year -eq 1 ]
                    then
                        echo "Year: $year is leap year"
                    else
                        echo "Year: $year is regular year"
                    fi
                else
                    echo "No a valid input please try again!"
                fi
        elif [ $option -eq 0 ];
        then
                echo "Exiting Bye Bye!" 
        else
                echo "Not a valid number"
        fi
done
