#!/bin/bash

echo "System information at Run Time : "

echo -e "
Host Name = $(hostname) 
CPU     = $(cat /proc/cpuinfo | grep -m1 "model name" | awk -F ":" '{print $NF}')
CPU MHz = $(lscpu | grep -m1 "CPU MHz" | awk -F ":" '{print $NF}')
NUMA node = $(lscpu | grep -m1 "NUMA node" | awk -F ":" '{print $NF}' )
uArch   = $(cat /proc/cpuinfo | grep -E -m 1 -o -h 'sse|sse2|sse3|ssse3|sse4_1|sse4_2|avx|avx2|fma|avx512' | tr -t '\n' ' ')
Sockets = $(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
Cores   = $(cat /proc/cpuinfo | grep "processor" | wc -l)
HT      = $(siblings=$(cat /proc/cpuinfo | grep -m1 "siblings" | awk -F ":" '{print $NF}');cores=$(cat /proc/cpuinfo | grep -m1 "cpu cores" | awk -F ":" '{print $NF}'); [ "$siblings" == "$cores" ] && echo "OFF" || echo "ON")
Memory  = $(cat /proc/meminfo | grep "MemTotal" | awk '{printf ("%.2f GB",$2/1000/1000)}')
Host Kernel/OS  = $(uname -r)
Uptime     = $(uptime)
lsb_release (container) = $(/usr/bin/lsb_release -a | grep "Description:")
icc version = $(ls /opt/intel/)
"
