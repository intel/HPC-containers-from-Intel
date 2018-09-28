#!/bin/bash

echo "System information at Run Time : "

echo "Host Name = $(hostname)" 
echo "Host Kernel/OS  = $(uname -r)"
echo "Uptime     = $(uptime)"
echo "lsb_release (container) = $(/usr/bin/lsb_release -a | grep "Description:")"
echo "compiler run time version= $(ls /opt/intel/) "

echo " "
echo "$lscpu: " 
lscpu

echo " "
echo "$numactl -H: "
numactl -H

echo " "
echo "$free -m: "
free -m
