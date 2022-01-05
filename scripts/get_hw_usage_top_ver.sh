#!/bin/bash
#./get_hw_usage.sh <delay>

# CPU Percentage
printf " CPU: $(LC_ALL=C top -b -d$1 -n2 | grep "Cpu(s)" | tail -1 | awk '{print 100 - $8}')%%"
# RAM Percentage
awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf " | RAM: %.1f% | ", 100-100*a/t}' /proc/meminfo;
# HDD Percentage
df /dev/sda3 | awk '/ \/$/{printf "HDD: %s ", $5}'
