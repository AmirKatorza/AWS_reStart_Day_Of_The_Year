#! /bin/bash
source is_leap.sh

function days_in_month() {
    year=$1
    leap=1
    month=$2

    case $month in
        1|3|5|7|8|10|12 )
            echo "31" ;;
        4|6|9|11 )
            echo "30" ;;
        2 )
            if [ $leap -eq 1 ];
            then    
                echo "29"
            else    
                echo "28"
            fi ;;
    esac
}

days=$(days_in_month 1998 4)
echo $days


