#!/bin/bash

echo "Enter hostname or IP address:"
read host

if ping -c 4 "$host" > /dev/null 2>&1
then
    echo "Network is reachable"
else
    echo "Network is not reachable"
fi