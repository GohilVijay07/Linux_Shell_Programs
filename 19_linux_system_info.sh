#!/bin/bash

echo "===== LINUX SYSTEM INFORMATION ====="

echo "Linux Distribution:"
cat /etc/os-release | grep PRETTY_NAME

echo
echo "Kernel Version:"
uname -r

echo
echo "Hostname:"
hostname

echo
echo "CPU Architecture:"
uname -m

echo
echo "Memory Information:"
free -h

echo
echo "System Uptime:"
uptime -p

echo "===== REPORT COMPLETED ====="