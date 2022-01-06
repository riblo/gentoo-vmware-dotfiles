#!/bin/bash
# $ ./get_hw_usage.sh <sleep>
# CPU: 0.8% | RAM: 18.1% | HDD: 53% 

###############################################################################################################
# CPU average data from /proc/stat:
# 
#      1       2        3      4        5     6      7       8
#     user    nice   system  idle      iowait irq   softirq  steal  guest  guest_nice
# cpu 874582  80341  1020232 39804325  14982  0     38334    0      0      0
#
# https://stackoverflow.com/questions/23367857/accurate-calculation-of-cpu-usage-given-in-percentage-in-linux:
# total with "iowait" added, in order to align value to "top" command
###############################################################################################################

LC_NUMERIC=en_US.UTF-8

# Gathering data
cpu_t0=($(sed -n '1p' /proc/stat))
cpu_t0_values=${cpu_t0[@]:1:8}
cpu_t0_total=$((${cpu_t0_values// /+}))
sleep "$1"
cpu_t1=($(sed -n '1p' /proc/stat))
cpu_t1_values=${cpu_t1[@]:1:8}
cpu_t1_total=$((${cpu_t1_values// /+}))

# Calculate deltas
total_d=$((cpu_t1_total - cpu_t0_total))
idle_d=$((cpu_t1[4] - cpu_t0[4]))

# CPU Percentage with static
cpu_perc=$(printf "%.1f%" "$(awk "BEGIN {print ($total_d - $idle_d)/$total_d*100}")")

if [ ${#cpu_perc} -lt 4 ]; then
    printf "CPU:  %.1f%% | " "$cpu_perc"
elif [ ${#cpu_perc} -lt 5 ]; then
    printf "CPU: %.1f%% | " "$cpu_perc"
else
    printf "CPU: 100%%  | " "$cpu_perc"
fi

# RAM Percentage
awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf "RAM: %.1f% | ", 100-100*a/t}' /proc/meminfo;
# HDD Percentage
df /dev/sda3 | awk '/ \/$/{printf "HDD: %s ", $5}'
