#!/bin/sh

# --start THIS SCRIPT FROM THE SAME DIR WHERE IT IS STORED

filename="battery_log.csv"

if [ $# -eq 0 ]; then # if no params
    # using printf for formatted output, bashlash on everyline for escaping new lines
    printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" \
        "$(date +%F,%T)" \
        "$(cat /sys/class/power_supply/BAT0/capacity)" \
        "$(cat /sys/class/power_supply/BAT0/status)" \
        "$(cat /sys/class/power_supply/BAT0/capacity_level)" \
        "$(cat /sys/class/power_supply/BAT0/cycle_count)" \
        "$(cat /sys/class/power_supply/BAT0/charge_now)" \
        "$(cat /sys/class/power_supply/BAT0/charge_full)" \
        "$(cat /sys/class/power_supply/BAT0/charge_full_design)" \
        "$(cat /sys/class/power_supply/BAT0/current_now)" \
        "$(cat /sys/class/power_supply/BAT0/voltage_now)" \
        "$(cat /sys/class/power_supply/BAT0/voltage_min_design)" \
        >> $filename
elif [ $# -gt 1 ]; then # if 2 params or more
    echo "Only one parameter is supported!"
    exit 1
elif [ $1 == "--start" ]; then
    # if old log exists move the old one and create new
    if [ -f $filename ]; then
        filename_no_ext="${filename%.*}" # split file name var into name and extension using the last .
        extension="${filename##*.}"
        mv $filename ${filename_no_ext}_$(date +%s).$extension # add current epoch to the old log
    fi

    # create a header
    echo "Date,Time,Capacity,Status,Capacity level,Cycle count,Charge level,Charge level when full,Original max charge level,Current,Voltage,Min voltage" >> $filename

    # add script to cron and run every minute
    script_path=$(realpath $0)
    crontab -l > temp_mycron
    sed -i "\#$(realpath $0)#d" ./temp_mycron # checking if this script is in the cron already and removing; using hash as sed delimiter because path contains slashes
    echo "* * * * * cd $(dirname $script_path) && $script_path" >> temp_mycron # cd into dir name for keeping the log in the same dir as script
    crontab temp_mycron
    rm temp_mycron

    # rerun this script but without the param - log battery data right now
    $($0)
elif [ $1 == "--stop" ]; then
    # remove cron job
    crontab -l > temp_mycron
    sed -i "\#$(realpath $0)#d" ./temp_mycron # using hash as sed delimiter because path contains slashes
    crontab temp_mycron
    rm temp_mycron
# elif [ $1 == "--help" ]; then # add help for this script
else
    echo "Parameter $1 not supported."
    exit 2
fi
