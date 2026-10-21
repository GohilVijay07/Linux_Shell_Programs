#!/bin/bash

echo "CPU Usage:"
top -bn1 | grep "%Cpu"

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "System Uptime:"
uptime -p

echo "Logged-in Users:"
who

echo "Running Processes:"
ps -e